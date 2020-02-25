class UserData {
  int id;
  String name;
  String email;

  UserData({
    this.id,
    this.name,
    this.email,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}
