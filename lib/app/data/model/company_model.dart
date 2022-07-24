import 'package:barbearia_jl_app/app/data/model/employee_model.dart';

class Company {
  int id;
  String name;
  String latitude;
  String longitude;
  String phone;
  String socialLink;
  List<Employee> employee;

  Company(
      {this.id,
      this.name,
      this.latitude,
      this.longitude,
      this.phone,
      this.socialLink,
      this.employee});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone = json['phone'];
    socialLink = json['social_link'];
    if (json['employees'] != null) {
      employee = <Employee>[];
      json['employees'].forEach((v) {
        employee.add(new Employee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['phone'] = this.phone;
    data['social_link'] = this.socialLink;
    if (this.employee != null) {
      data['employees'] = this.employee.map((v) => v.toJson()).toList();
    }
    return data;
  }
}