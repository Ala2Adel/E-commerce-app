class UserModel {
  int? userId;
  late String userName;
  late String firstName;
  late String lastName;
  late String email;
  bool? isSuper;
  bool? isStaff;
  bool? isActive;
  String? dateJoined;
  List? groups;
  List? userPerm;

  UserModel(
      {this.userId,
      required this.userName,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.isSuper,
      this.isStaff,
      this.isActive,
      this.dateJoined,
      this.groups,
      this.userPerm});

  UserModel.fromJson(Map<String, dynamic> data) {
    userId = data['id'];
    userName = data["username"];
    firstName = data["first_name"];
    lastName = data["last_name"];
    email = data["email"];
  }

// Map<String, dynamic> toJson() => {
//       "username": userName,
//       "first_name": firstName,
//       "last_name": lastName,
//       "email": email,
//       "password": null,
//     };
}
