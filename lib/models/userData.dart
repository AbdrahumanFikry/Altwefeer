class UserData {
  int id;
  String email;
  String phone;

  UserData({
    this.id,
    this.email,
    this.phone,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'] == null ? 'error fetching email' : json['email'];
    phone = json['phone'] == null ? 'error fetching phone' : json['phone'];
  }
}
