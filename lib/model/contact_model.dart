// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

List<ContactModel> contactModelFromJson(String str) => List<ContactModel>.from(json.decode(str).map((x) => ContactModel.fromJson(x)));

String contactModelToJson(List<ContactModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactModel {
    ContactModel({
       this.id,
       this.email,
       this.number,
       this.address,
       this.createdAt,
       this.updatedAt,
    });

    int? id;
    String? email;
    String? number;
    String? address;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        email: json["email"],
        number: json["number"],
        address: json["address"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id!,
        "email": email!,
        "number": number!,
        "address": address!,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
