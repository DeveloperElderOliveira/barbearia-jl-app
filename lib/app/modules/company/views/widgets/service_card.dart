import 'package:barbearia_jl_app/app/data/model/service_model.dart';
import 'package:barbearia_jl_app/app/global/constants.dart';
import 'package:barbearia_jl_app/app/modules/company/controllers/company_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceCard extends StatelessWidget {
  final controller = Get.find<CompanyController>();
  final Service service;
  ServiceCard(this.service);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              // Container(
              //   height: 100,
              //   width: 100,
              //   margin: EdgeInsets.only(right: 10),
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: NetworkImage(service.image != null ? employee.image : "https://i.imgur.com/pBcut2e.jpeg"),
              //     ),
              //   ),
              // ),
              Expanded(
                child: ListTile(
                  leading: CircleAvatar(
                    child:Center(
                      child: Text(
                        '${service.name.substring(0,1)?.toUpperCase()}',
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
                      "${service.name}",
                      style:TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                     subtitle: Text(
                      "${service.description ?? '...'}",
                      style: TextStyle(fontSize: 14),
                    ),            
                ),
              ),
              InkWell(
                onTap: () {
                  controller.createScheduling(service);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    color: Colors.green,
                  ),
                  child: Text(
                    "R\$ ${formatcurrency.format(service.price)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
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