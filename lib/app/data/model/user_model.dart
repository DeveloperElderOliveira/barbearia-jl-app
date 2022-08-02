import 'package:barbearia_jl_app/app/data/model/employee_model.dart';

class User {
  int id;
  String name;
  String email;
  int activated;
  String image;
  List<Employee> employees;

  User({this.id, this.name, this.email, this.activated, this.image, this.employees});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    activated = json['activated'];
    image = json['image'];
    if (json['employees'] != null) {
      employees = <Employee>[];
      json['employees'].forEach((v) {
        employees.add(Employee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['activated'] = activated;
    data['image'] = image;
    if (this.employees != null) {
      data['employees'] = this.employees.map((v) => v.toJson()).toList();
    }
    return data;
  }
}