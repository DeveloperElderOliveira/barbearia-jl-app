import 'package:barbearia_jl_app/app/data/model/employee_model.dart';
import 'package:barbearia_jl_app/app/data/model/service_model.dart';

class Schedule {
  int id;
  String schedulingDate;
  int userId;
  int employeeId;
  int serviceId;
  Employee employee;
  Service service;

  Schedule(
      {this.id,
      this.schedulingDate,
      this.userId,
      this.employeeId,
      this.serviceId,
      this.employee,
      this.service});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schedulingDate = json['scheduling_date'];
    userId = json['user_id'];
    employeeId = json['employee_id'];
    serviceId = json['service_id'];
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scheduling_date'] = this.schedulingDate;
    data['user_id'] = this.userId;
    data['employee_id'] = this.employeeId;
    data['service_id'] = this.serviceId;
    if (this.employee != null) {
      data['employee'] = this.employee.toJson();
    }
    if (this.service != null) {
      data['service'] = this.service.toJson();
    }
    return data;
  }
}