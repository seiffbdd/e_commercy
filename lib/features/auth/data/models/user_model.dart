class UserModel {
  String name;
  String email;
  String password;

  UserModel({required this.name, required this.email, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson(UserModel user) {
    return {'name': name, 'email': email, 'password': password};
  }
}
