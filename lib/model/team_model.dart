// To parse this JSON data, do
//
//     final teamModel = teamModelFromJson(jsonString);

import 'dart:convert';

List<TeamModel> teamModelFromJson(String str) => List<TeamModel>.from(json.decode(str).map((x) => TeamModel.fromJson(x)));

String teamModelToJson(List<TeamModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeamModel {
    TeamModel({
       this.id,
       this.description,
       this.createdAt,
       this.updatedAt,
    });

    int? id;
    String? description;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
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