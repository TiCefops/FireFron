// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.username,
    required this.password,
    required this.email,
    required this.fristName,
    required this.lastName,
  });

  String username;
  String password;
  String email;
  String fristName;
  String lastName;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    username: json["username"],
    password: json["password"],
    email: json["email"],
    fristName: json["fristName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "email": email,
    "fristName": fristName,
    "lastName": lastName,
  };
}
