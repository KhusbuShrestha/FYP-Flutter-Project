// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    CartModel({
        required this.data,
    });

    List<Datum> data;

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.sp,
        this.quantity,
        this.product,
        this.user,
        this.picture,
    });

    int? id;
    String? name;
    double? sp;
    int? quantity;
    int? product;
    int? user;
    String? picture;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        sp: json["sp"].toDouble(),
        quantity: json["quantity"],
        product: json["product"],
        user: json["user"],
        picture: json["picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sp": sp!,
        "quantity": quantity,
        "product": product,
        "user": user,
        "picture": picture,
    };
}
