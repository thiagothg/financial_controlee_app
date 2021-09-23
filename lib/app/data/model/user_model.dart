class UserModel {
  String id;
  String name;
  String email;
  String? urlImage;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      this.urlImage});

  // UserModel.fromJson(Map<String, dynamic> json) {
  //   this.id = json['id'];
  //   this.name = json['name'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   return data;
  // }
}
