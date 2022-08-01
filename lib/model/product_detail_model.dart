// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
    ProductDetailModel({
        required this.data,
    });

    List<Datum> data;

    factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.sku,
        this.name,
        this.price,
        this.discount,
        this.sp,
        this.description,
        this.category,
        this.picture,
    });

    int? id;
    String? sku;
    String? name;
    double? price;
    int? discount;
    double? sp;
    String? description;
    int? category;
    String? picture;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sku: json["sku"],
        name: json["name"],
        price: json["price"].toDouble(),
        discount: json["discount"],
        sp: json["sp"].toDouble(),
        description: json["description"],
        category: json["category"],
        picture: json["picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id!,
        "sku": sku!,
        "name": name!,
        "price": price!,
        "discount": discount!,
        "sp": sp!,
        "description": description!,
        "category": category!,
        "picture": picture!,
    };
}
