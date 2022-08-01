// To parse this JSON data, do
//
//     final topProductsModel = topProductsModelFromJson(jsonString);

import 'dart:convert';

TopProductsModel topProductsModelFromJson(String str) => TopProductsModel.fromJson(json.decode(str));

String topProductsModelToJson(TopProductsModel data) => json.encode(data.toJson());

class TopProductsModel {
    TopProductsModel({
        required this.data,
    });

    List<Datum> data;

    factory TopProductsModel.fromJson(Map<String, dynamic> json) => TopProductsModel(
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
        this.image,
        this.price,
        this.discount,
        this.sellingPrice,
        this.description,
        this.product,
        this.rating,
        this.category,
    });

    int? id;
    String? sku;
    String? image;
    double? price;
    int? discount;
    double? sellingPrice;
    String? description;
    String? product;
    int? rating;
    int? category;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sku: json["sku"],
        image: json["image"],
        price: json["price"].toDouble(),
        discount: json["discount"] == null ? null : json["discount"],
        sellingPrice: json["selling_price"].toDouble(),
        description: json["description"],
        product: json["product"],
        rating: json["rating"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "image": image,
        "price": price,
        "discount": discount == null ? null : discount,
        "selling_price": sellingPrice,
        "description": description,
        "product": product,
        "rating": rating,
        "category": category,
    };
}
