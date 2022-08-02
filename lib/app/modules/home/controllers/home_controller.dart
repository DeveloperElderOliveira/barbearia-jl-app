// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:barbearia_jl_app/app/data/model/auth_model.dart';
import 'package:barbearia_jl_app/app/data/model/company_model.dart';
import 'package:barbearia_jl_app/app/data/model/schedule_model.dart';
import 'package:barbearia_jl_app/app/data/model/service_model.dart';
import 'package:barbearia_jl_app/app/data/repository/company_repository.dart';
import 'package:barbearia_jl_app/app/data/repository/schedule_repository.dart';
import 'package:barbearia_jl_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../global/widgets/navigation_item.dart';

class HomeController extends GetxController with StateMixin{

  //Essential
  final box = GetStorage('barbearia-jl');
  final scheduleRepository = Get.find<ScheduleRepository>();
  final companyRepository = Get.find<CompanyRepository>();

  //Bottom Nav Custom
  RxInt selectedIndex = 0.obs;
  Color backgroundColorNav = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(const Icon(Icons.home), const Text('Início'), Colors.black),
    NavigationItem(const Icon(Icons.schedule), const Text('Agendar'), Colors.black),
    NavigationItem(const Icon(Icons.g_translate), const Text('Localizar'),Get.theme.primaryColor),
    NavigationItem(const Icon(Icons.person_outline), const Text('Perfil'), Colors.black)
  ];

  // Page 1
  RxList<Schedule> listSchedules = <Schedule>[].obs;
  
  // Page 2
  // -12.833471, longitude: -38.472161,
  Rx<LatLng> center = LatLng(-12.833471, -38.472161).obs;
  Completer<GoogleMapController> gmapController = Completer();
  LatLng lastMapPosition;
  Position currentLocation;
  Set<Marker> markers = {};
  List<Service> servicosSelecionados = [];
  RxList<Company> listCompanies = <Company>[].obs;
  // Page 3
  Auth auth;


  @override
  void onInit() {
    loadDataSchedules();
    loadCompanies();
    auth = box.read('auth');
    getUserLocation();
    super.onInit();
  }

  void choiceIndex(int index){
    selectedIndex.value = index;
  }

  void loadDataSchedules() async{
    await scheduleRepository.getAll().then((value){
      listSchedules.assignAll(value);
      if(value.length > 0) change(value, status: RxStatus.success());
      else change(null, status: RxStatus.empty());
    }, onError: (err){
      change(null, status: RxStatus.error('Houve um erro na requisição.'));
    });
  }
  void loadCompanies() async {
    await companyRepository.getAll().then((value){
      listCompanies.assignAll(value);
    });
  }
  // void loadDataCompaniesMarkers() async{
  //   await companyRepository.getAll().then((value){
  //     listCompanies.assignAll(value);
  //   });
  //   loadMarkers();
  // }

  void loadMarkers() {
    if (listCompanies.length > 0) {
      listCompanies.forEach((e) {
        markers.add(
          Marker(
              markerId: MarkerId(e.id.toString()),
              position: LatLng(
                double.tryParse('-12.833471'),
                double.tryParse('-38.472161'),
              ),
              // infoWindow: InfoWindow(
              //   title: e.name,
              //   snippet: e.phone,
              //   onTap: () {
              //     print('Compania clicada ID ${e.id}');
              //   },
              // ), 
              icon: BitmapDescriptor.defaultMarker,
              onTap: () {
                Get.defaultDialog(
                  title: "${e.name}",
                  content: Text("Telefone: ${e.phone ?? '...'}"),
                  actions: [
                    FlatButton(
                      color: Get.theme.primaryColor,
                      onPressed: () {
                        Get.back();
                        openCompany(e);
                      },
                      child: Text("Abrir"),
                    ),
                    FlatButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cancelar"),
                    ),
                  ],
                );
              }
          ),
        );
      });
    }
  }

  void openCompany(Company company) async{
    var result = await Get.toNamed(Routes.COMPANY, arguments: company);
    if(result != null){
      selectedIndex.value = 0;
      loadDataSchedules();
    }
  }

  void createScheduling() async{
    print(servicosSelecionados);
    var result = await Get.toNamed(Routes.SCHEDULES, arguments: servicosSelecionados);
    if(result != null){
      Get.back(result: "OK");
    }
  }

  void onMapCreated(GoogleMapController controller) {
    gmapController.complete(controller);
  }

  void onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    // center.value = LatLng(currentLocation.latitude, currentLocation.longitude);
    print('center $center');
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
  }

  void logout(){
    box.erase();
    Get.offAllNamed(Routes.LOGIN);
  }

}
