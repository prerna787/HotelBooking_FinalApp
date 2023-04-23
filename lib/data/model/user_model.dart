class UserModel {
  String? username;
  String? password;

  String? token;

  // Constructor
  UserModel(
    this.username,
    this.password,
    this.token,
  );

  // Named constructor
  UserModel.fromJson({required Map<String, dynamic> data}) {
    // Refactoring Map | Json
    username = data['username'];
    password = data['password'];

    token = data['token'];
  }

  // To Map
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'token': token,
    };
  }
}
