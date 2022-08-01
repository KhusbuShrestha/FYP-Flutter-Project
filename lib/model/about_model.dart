// To parse this JSON data, do
//
//     final aboutModel = aboutModelFromJson(jsonString);

import 'dart:convert';

List<AboutModel> aboutModelFromJson(String str) => List<AboutModel>.from(json.decode(str).map((x) => AboutModel.fromJson(x)));

String aboutModelToJson(List<AboutModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AboutModel {
    AboutModel({
       this.id,
       this.description,
       this.createdAt,
       this.updatedAt,
    });

    int? id;
    String? description;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory AboutModel.fromJson(Map<String, dynamic> json) => AboutModel(
        id: json["id"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id!,
        "description": description!,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
