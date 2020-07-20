// To parse this JSON data, do
//
//     final apiError = apiErrorFromJson(jsonString);

import 'dart:convert';

ApiError apiErrorFromJson(String str) => ApiError.fromJson(json.decode(str));

String apiErrorToJson(ApiError data) => json.encode(data.toJson());

class ApiError {
  ApiError({
    this.msg,
    this.code,
    this.request,
    this.localizedMessage,
  });

  String msg;
  int code;
  String request;
  String localizedMessage;

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
    msg: json["msg"],
    code: json["code"],
    request: json["request"],
    localizedMessage: json["localized_message"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "code": code,
    "request": request,
    "localized_message": localizedMessage,
  };
}
