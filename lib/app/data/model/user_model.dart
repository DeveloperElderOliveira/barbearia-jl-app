class User {
  int id;
  String name;
  String email;
  int activated;

  User({this.id, this.name, this.email, this.activated});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    activated = json['activated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['activated'] = activated;
    return data;
  }
}