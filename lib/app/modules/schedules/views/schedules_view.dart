import 'package:barbearia_jl_app/app/global/constants.dart';
import 'package:barbearia_jl_app/app/modules/schedules/controllers/schedules_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchedulesView extends GetView<SchedulesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar Atendimento'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: controller.onsave,
          )
        ],
      ),
      body: Form(
        key: controller.formkey,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text('${controller.service.name}', style: TextStyle(fontSize: 20)),
                      subtitle: Text('${controller.service.description}'),
                    ),
                    Divider(color: Colors.black),
                    ListTile(
                      title: Text('Preço'),
                      trailing: Text(
                        "R\$ ${formatcurrency.format(controller.service.price)}",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.dateController,
                showCursor: true,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Data Prevista',
                  icon: Icon(Icons.today),
                ),
                onTap: controller.openCalendar,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo requerido.';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.timeController,
                showCursor: true,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Hora Prevista',
                  icon: Icon(Icons.access_time),
                ),
                onTap: controller.openClock,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo requerido.';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                showCursor: true,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Escolha um Funcionário (Opcional)',
                  icon: Icon(Icons.account_circle),
                ),
                onTap: controller.openEmployeePage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}