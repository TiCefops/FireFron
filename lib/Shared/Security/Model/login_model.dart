
import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
   required this.alunoId,
   required this.role,
   required this.foto,
   required this.fullName,
   required this.token,
  });

  String alunoId;
  List<String> role;
  String foto;
  String fullName;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    alunoId: json["AlunoId"],
    role: List<String>.from(json["role"].map((x) => x)),
    foto: json["foto"],
    fullName: json["FullName"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "AlunoId": alunoId,
    "role": List<dynamic>.from(role.map((x) => x)),
    "foto": foto,
    "FullName": fullName,
    "token": token,
  };
}
