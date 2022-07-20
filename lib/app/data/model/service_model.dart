class Service {
  int id;
  String name;
  int price;
  int employeeId;

  Service({this.id, this.name, this.price, this.employeeId});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    employeeId = json['employee_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['employee_id'] = this.employeeId;
    return data;
  }
}