import 'package:barbearia_jl_app/app/data/model/service_model.dart';
// import 'package:barbearia_jl_app/app/global/constants.dart';
import 'package:barbearia_jl_app/app/modules/company/controllers/company_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceCard extends StatefulWidget {
  final Service service;
  ServiceCard(this.service);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  final controller = Get.find<CompanyController>();

  @override
  Widget build(BuildContext context) {
    var isSelected = false;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  leading: CircleAvatar(
                    child:Center(
                      child: Text(
                        '${widget.service.name.substring(0,1)?.toUpperCase()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white
                        ),
                      ),
                    ),
                    backgroundColor: Colors.black,
                     ),
                     title: Text(
                      "${widget.service.name}",
                      style:TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                     subtitle: Text(
                      "${widget.service.description ?? '...'}",
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: isSelected ?
                     Icon(Icons.check_circle, color: Colors.green[700]) :
                     Icon(Icons.check_circle_outline, color: Colors.grey ,
                     ),            
                     onTap: (){
                      setState((){
                        isSelected = !isSelected;
                      });
                      
                     },
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     // controller.createScheduling(service);
              //   },
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(40),
              //       ),
              //       color: Colors.green,
              //     ),
              //     child: Text(
              //       "R\$ ${formatcurrency.format(service.price)}",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 18,
              //         fontWeight: FontWeight.w700,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}