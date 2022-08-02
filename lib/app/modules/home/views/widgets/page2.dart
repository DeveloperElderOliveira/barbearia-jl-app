// ignore_for_file: deprecated_member_use
import 'package:barbearia_jl_app/app/data/model/service_model.dart';
import 'package:barbearia_jl_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Page2 extends StatefulWidget {
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final controller = Get.find<HomeController>();

  final NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  appBarDinamica(){
    if(controller.servicosSelecionados.isEmpty){
      return AppBar(
        title: const Text('Escolha os cortes'),
        centerTitle: true,
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              controller.servicosSelecionados = [];
            });
          },
        ),
        title: Text('${controller.servicosSelecionados.length} selecionados'),
        centerTitle: true,
        backgroundColor: Get.theme.primaryColor,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black87),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        ),
      );
    }
    
  }

 @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Scaffold(
        appBar: appBarDinamica(),
        body: ListView.separated(
          itemBuilder: (context, index){
            Service service = controller.listCompanies[0].services[index];
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              leading: (controller.servicosSelecionados.contains(service)) 
              ? CircleAvatar(child: Icon(Icons.check),)
              : SizedBox(child: Image.asset("assets/barber.png"),
              width: 40,
              ),
              title: Text(service.name, style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(real.format(service.price)),
              selected: controller.servicosSelecionados.contains(service),
              selectedTileColor: Colors.black,
              onTap: (() {
                print(service.name);
                setState(() {
                  (controller.servicosSelecionados.contains(service))
                  ? controller.servicosSelecionados.remove(service)
                  : controller.servicosSelecionados.add(service);
                });
              }),
            );
          }, 
          padding: EdgeInsets.all(16),
          separatorBuilder: (_,__) => Divider(), 
          itemCount: controller.listCompanies[0].services.length
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: controller.servicosSelecionados.isNotEmpty 
            ? FloatingActionButton.extended(
            onPressed: (){
              controller.createScheduling();
            },
             icon: Icon(Icons.star),
             label: Text(
              "AGENDAR",
              style: TextStyle(
                letterSpacing: 0,
                fontWeight: FontWeight.bold
              ),
             )) : null ,
      )
    );
  }
}