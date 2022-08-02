// import 'package:barbearia_jl_app/app/global/constants.dart';
import 'package:barbearia_jl_app/app/global/constants.dart';
import 'package:barbearia_jl_app/app/modules/schedules/controllers/schedules_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchedulesView extends GetView<SchedulesController> {
  final dropValue = ValueNotifier('');
  final dropOpcoes = ['08:00','09:00','10:00','11:00','12:00'];

  appBarDinamica(){
    // ignore: deprecated_member_use
    if(dropValue.value.isEmpty && controller.dateController.selection.toString() == 'TextSelection.invalid'){
      return AppBar(
        title: Text('Escolha o dia e horário.'),
        centerTitle: true,
      );
    }else{
      return AppBar(
        title: Text('Agendar atendimento.'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: controller.onsave,
            // color: Colors.amber,
          )
        ],
        backgroundColor: Get.theme.primaryColor,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black87),
        // ignore: deprecated_member_use
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
    return Scaffold(
      appBar: appBarDinamica(),
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
                      title: Text(
                        '${controller.servicesName}', style: TextStyle(fontSize: 20)),
                    ),
                    Divider(color: Colors.black),
                    ListTile(
                      title: Text('Preço Total'),
                      trailing: Text(
                        "R\$ ${formatcurrency.format(controller.servicesPrice)}",
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
                  icon: Icon(Icons.today),
                  label: const Text('Dia'),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                    ),
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
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                valueListenable: dropValue,
                builder: ((context, value, child) {
                  return SizedBox(
                    width: 280,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      // hint: const Text('Escolha um horário'),
                      decoration: InputDecoration(
                        icon: const Icon(Icons.watch_later_outlined),
                        label: const Text('Horário'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      value: (value.isEmpty) ? null : value,
                      onChanged: (escolha) {
                        dropValue.value = escolha.toString();
                      },
                      items: dropOpcoes.map((op) => DropdownMenuItem(
                        value: op,
                        child: Text(op)
                      ),).toList(),
                      validator: (value) {
                        // ignore: deprecated_member_use
                        if (value.isNull) {
                          return 'Campo requerido, escolha um horário disponível.';
                        }
                          return null;
                        }
                    ),
                  );
                }),
              )
            ),
          ],
        ),
      ),
    );
  }
}