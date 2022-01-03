
import 'dart:convert';

ErrorModel errorModelFromJson(String str) => ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  ErrorModel({
    required this.timestamp,
    required this.message,
    required this.details,
  });

  DateTime timestamp;
  String message;
  String details;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    timestamp: DateTime.parse(json["timestamp"]),
    message: json["message"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "message": message,
    "details": details,
  };
}
