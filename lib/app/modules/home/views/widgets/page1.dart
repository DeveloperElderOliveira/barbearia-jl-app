import 'package:barbearia_jl_app/app/data/model/schedule_model.dart';
import 'package:barbearia_jl_app/app/global/constants.dart';
import 'package:barbearia_jl_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class Page1 extends StatelessWidget {
 final controller = Get.find<HomeController>(); 
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (list) => Expanded(
            child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context,index){
              Schedule schedule = list[index];
              // return ListTile(
              //   title: Text("${schedule.service.name}"),
              //   subtitle: Text("${schedule.schedulingDate}"),
              // );
              return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              padding: EdgeInsets.all(20),
                              color: Color(0xffdfdeff),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${schedule.service.name}", style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700
                                  ),),
                                  SizedBox(height: 10,),
                                  Text('Horário do Agendamento', style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500
                                  ),),
                                  SizedBox(height: 5,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.timer, color:Colors.black,),
                                      SizedBox(width: 5,),
                                      Text("${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(schedule.schedulingDate))}", style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600
                                      ),)
                                    ],
                                  ),
                                  SizedBox(height: 5,),     
                                  SizedBox(height: 5,),
                                  Container(
                                    height: 0.5,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.person, color: Colors.black,),
                                      Text(" Elder Oliveira"),
                                      SizedBox(width: 20,),
                                      Text(" | "),
                                      // Icon(Icons.call, color: Colors.black,),
                                      Text(" (71) 99316-4658"),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      Text("R\$ ${formatcurrency.format(schedule.service.price)}", style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      ),)
                                    ],
                                  )
      
                                ],
                              ),
                            ),
                          )
                        ],
                      );
            },
          ),
      ),
      onError: (err) => Expanded(child: Center(child:Text('$err'))),
      onEmpty: Expanded(child: Center(child:Text('Nenhum Agendamento Realizado.')))
    );
  }
}