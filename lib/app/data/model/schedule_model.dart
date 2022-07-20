class Schedule {
  int id;
  String schedulingDate;
  int userId;
  int employeeId;
  int serviceId;

  Schedule(
      {this.id,
      this.schedulingDate,
      this.userId,
      this.employeeId,
      this.serviceId});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schedulingDate = json['scheduling_date'];
    userId = json['user_id'];
    employeeId = json['employee_id'];
    serviceId = json['service_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scheduling_date'] = this.schedulingDate;
    data['user_id'] = this.userId;
    data['employee_id'] = this.employeeId;
    data['service_id'] = this.serviceId;
    return data;
  }
}