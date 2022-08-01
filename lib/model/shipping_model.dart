// To parse this JSON data, do
//
//     final shippingModel = shippingModelFromJson(jsonString);

import 'dart:convert';

List<ShippingModel> shippingModelFromJson(String str) => List<ShippingModel>.from(json.decode(str).map((x) => ShippingModel.fromJson(x)));

String shippingModelToJson(List<ShippingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShippingModel {
    ShippingModel({
       this.id,
       this.description,
       this.createdAt,
       this.updatedAt,
    });

    int? id;
    String? description;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory ShippingModel.fromJson(Map<String, dynamic> json) => ShippingModel(
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
