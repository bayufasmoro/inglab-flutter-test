// To parse this JSON data, do
//
//     final contactsResponse = contactsResponseFromJson(jsonString);

import 'dart:convert';

ContactsResponse contactsResponseFromJson(String str) => ContactsResponse.fromJson(json.decode(str));

String contactsResponseToJson(ContactsResponse data) => json.encode(data.toJson());

class ContactsResponse {
  bool? success;
  Status? status;
  List<ContactData>? data;

  ContactsResponse({
    this.success,
    this.status,
    this.data,
  });

  factory ContactsResponse.fromJson(Map<String, dynamic> json) => ContactsResponse(
    success: json["success"],
    status: json["status"] == null ? null : Status.fromJson(json["status"]),
    data: json["data"] == null ? [] : List<ContactData>.from(json["data"]!.map((x) => ContactData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status": status?.toJson(),
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ContactData {
  String? id;
  String? name;
  String? email;

  ContactData({
    this.id,
    this.name,
    this.email,
  });

  factory ContactData.fromJson(Map<String, dynamic> json) => ContactData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
  };
}

class Status {
  String? code;
  String? message;

  Status({
    this.code,
    this.message,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}
