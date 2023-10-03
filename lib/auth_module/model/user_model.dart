// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? token;
  User user;

  UserModel({
     this.token,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  int? id;
  String password;
  dynamic lastLogin;
  bool? isSuperuser;
  String email;
  String? firstName;
  String? lastName;
  bool? isActive;
  bool? isStaff;
  List<dynamic>? groups;
  List<dynamic>? userPermissions;

  User({
     this.id,
    required this.password,
    this.lastLogin,
     this.isSuperuser,
    required this.email,
     this.firstName,
     this.lastName,
     this.isActive,
     this.isStaff,
     this.groups,
     this.userPermissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    password: json["password"],
    lastLogin: json["last_login"],
    isSuperuser: json["is_superuser"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    isActive: json["is_active"],
    isStaff: json["is_staff"],
    groups: List<dynamic>.from(json["groups"].map((x) => x)),
    userPermissions: List<dynamic>.from(json["user_permissions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "password": password,
    "last_login": lastLogin,
    "is_superuser": isSuperuser,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "is_active": isActive,
    "is_staff": isStaff,
    "groups": List<dynamic>.from(groups!.map((x) => x)),
    "user_permissions": List<dynamic>.from(userPermissions!.map((x) => x)),
  };
}
