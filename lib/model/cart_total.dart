// To parse this JSON data, do
//
//     final cartTotalModel = cartTotalModelFromJson(jsonString);

import 'dart:convert';

CartTotalModel cartTotalModelFromJson(String str) => CartTotalModel.fromJson(json.decode(str));

String cartTotalModelToJson(CartTotalModel data) => json.encode(data.toJson());

class CartTotalModel {
    CartTotalModel({
        required this.total,
    });

    double? total;

    factory CartTotalModel.fromJson(Map<String, dynamic> json) => CartTotalModel(
        total: json["total"].toDouble(),
    );

  get isEmpty => null;

    Map<String, dynamic> toJson() => {
        "total": total!,
    };
}
