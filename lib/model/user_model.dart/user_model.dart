class UserModel {
  final String? id;
  final String email;
  final String name;
  final String password;
  UserModel({
    required this.email,
    required this.name,
    required this.password,
    this.id,
  });
  toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
