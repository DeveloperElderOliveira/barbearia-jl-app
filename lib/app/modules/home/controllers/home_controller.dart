// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:barbearia_jl_app/app/data/model/auth_model.dart';
import 'package:barbearia_jl_app/app/data/model/company_model.dart';
import 'package:barbearia_jl_app/app/data/model/schedule_model.dart';
import 'package:barbearia_jl_app/app/data/repository/company_repository.dart';
import 'package:barbearia_jl_app/app/data/repository/schedule_repository.dart';
import 'package:barbearia_jl_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../global/widgets/navigation_item.dart';

class HomeController extends GetxController {

  //Essential
  final box = GetStorage('barbearia-jl');
  final scheduleRepository = Get.find<ScheduleRepository>();
  final companyRepository = Get.find<CompanyRepository>();

  //Bottom Nav Custom
  RxInt selectedIndex = 0.obs;
  Color backgroundColorNav = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(const Icon(Icons.home), const Text('Início'), Colors.black),
    NavigationItem(const Icon(Icons.search), const Text('Procurar'), Colors.pinkAccent),
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

  RxList<Company> listCompanies = <Company>[].obs;
  // Page 3
  Auth auth;


  @override
  void onInit() {
    auth = box.read('auth');
    getUserLocation();
    super.onInit();
  }

  void onReady()
  {
    loadDataSchedules();
    loadDataCompaniesMarkers();
    super.onReady();
  }

  void choiceIndex(int index){
    selectedIndex.value = index;
  }

  void loadDataSchedules() async{
    await scheduleRepository.getAll().then((value){
      listSchedules.assignAll(value);
    });
  }

  void loadDataCompaniesMarkers() async{
    await companyRepository.getAll().then((value){
      listCompanies.assignAll(value);
    });
    loadMarkers();
  }

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

  void openCompany(Company company){
    Get.toNamed(Routes.COMPANY, arguments: company);
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
