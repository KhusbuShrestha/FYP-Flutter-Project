// To parse this JSON data, do
//
//     final ratingModel = ratingModelFromJson(jsonString);

import 'dart:convert';

RatingModel ratingModelFromJson(String str) => RatingModel.fromJson(json.decode(str));

String ratingModelToJson(RatingModel data) => json.encode(data.toJson());

class RatingModel {
    RatingModel({
       required this.data,
    });

    List<Datum> data;

    factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
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
    int? price;
    int? discount;
    double? sellingPrice;
    String? description;
    String? product;
    double? rating;
    int? category;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sku: json["sku"],
        image: json["image"],
        price: json["price"],
        discount: json["discount"] == null ? null : json["discount"],
        sellingPrice: json["selling_price"].toDouble(),
        description: json["description"],
        product: json["product"],
        rating: json["rating"].toDouble(),
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
