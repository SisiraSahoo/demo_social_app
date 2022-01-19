// To parse this JSON data, do
//
//     final roomDetailsResponse = roomDetailsResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    this.accessToken,
    // this.authentication,
    this.user,
  });

  String? accessToken;
  // Authentication? authentication;
  UserData? user;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    accessToken: json["accessToken"],
    // authentication: Authentication.fromJson(json["authentication"]),
    user:json["user"] == null ? null : UserData.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    // "authentication": authentication?.toJson(),
    "user": user?.toJson(),
  };
}

class Authentication {
  Authentication({
    this.strategy,
    this.accessToken,
  });

  String? strategy;
  String? accessToken;

  factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
    strategy: json["strategy"],
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "strategy": strategy,
    "accessToken": accessToken,
  };
}

class UserData {
  UserData({
    this.id,
    this.email,
    this.name,
    this.dob,
    this.avatar,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? email;
  String? name;
  DateTime? dob;
  String? avatar;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["_id"] ?? '',
    email: json["email"] ?? '',
    name: json["name"] ?? '',
    dob:json["dob"] ==null ? null : DateTime.parse(json["dob"]),
    avatar: json["avatar"] ?? '',
    createdAt:json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"]?? '',
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "name": name,
    "dob": dob?.toIso8601String(),
    "avatar": avatar,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
