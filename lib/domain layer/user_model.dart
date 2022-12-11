class UserModel {
  late String userName;
  late String firstName;
  late String lastName;
  late String email;

  UserModel({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    userName = data["username"];
    firstName = data["first_name"];
    lastName = data["last_name"];
    email = data["email"];
  }

  static Map<String, dynamic> toJson(UserModel userModel) => {
        "username": userModel.userName,
        "first_name": userModel.firstName,
        "last_name": userModel.lastName,
        "email": userModel.email,
      };
}
