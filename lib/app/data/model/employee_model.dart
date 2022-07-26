class Employee {
  int id;
  String firstName;
  String lastName;
  String image;
  int userId;
  int companyId;

  Employee(
      {this.id,
      this.firstName,
      this.lastName,
      this.image,
      this.userId,
      this.companyId});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    userId = json['user_id'];
    companyId = json['company_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['company_id'] = this.companyId;
    return data;
  }
}