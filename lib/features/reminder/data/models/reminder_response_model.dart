import 'dart:convert';

import 'package:reminder/features/reminder/domain/entities/reminder_response.dart';

GetReminderResponseModel getReminderResponseModelFromJson(String str) => GetReminderResponseModel.fromJson(json.decode(str));

String getReminderResponseModelToJson(GetReminderResponseModel data) => json.encode(data.toJson());

class GetReminderResponseModel extends GetReminderResponse{

  GetReminderResponseModel({
    required code,
    required errorMessage,
    required data,
  }):super(
      code: code,
      errorMessage: errorMessage,
      data: data,
  );

  factory GetReminderResponseModel.fromJson(Map<String, dynamic> json) => GetReminderResponseModel(
    code: json["code"],
    errorMessage: json["errorMessage"],
    data: List<DatumResponseModel>.from(json["data"].map((x) => DatumResponseModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "errorMessage": errorMessage,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}

class DatumResponseModel extends DatumResponse {

  DatumResponseModel({
    required time,
    required text,
    required color,
  }):super(
      time: time,
      text: text,
      color: color,
  );

  factory DatumResponseModel.fromJson(Map<String, dynamic> json) => DatumResponseModel(
    time: DateTime.parse(json["time"]),
    text: json["text"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "time": time.toIso8601String(),
    "text": text,
    "color": color,
  };
}
