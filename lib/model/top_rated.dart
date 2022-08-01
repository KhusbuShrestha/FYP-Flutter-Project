// To parse this JSON data, do
//
//     final topRatedModel = topRatedModelFromJson(jsonString);

import 'dart:convert';

TopRatedModel topRatedModelFromJson(String str) => TopRatedModel.fromJson(json.decode(str));

String topRatedModelToJson(TopRatedModel data) => json.encode(data.toJson());

class TopRatedModel {
    TopRatedModel({
        required this.data,
    });

    List<Datum> data;

    factory TopRatedModel.fromJson(Map<String, dynamic> json) => TopRatedModel(
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
    dynamic discount;
    double? sellingPrice;
    String? description;
    String? product;
    double? rating;
    int? category;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sku: json["sku"],
        image: json["image"],
        price: json["price"].toDouble(),
        discount: json["discount"],
        sellingPrice: json["selling_price"].toDouble(),
        description: json["description"],
        product: json["product"],
        rating: json["rating"].toDouble(),
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id!,
        "sku": sku!,
        "image": image!,
        "price": price!,
        "discount": discount,
        "selling_price": sellingPrice!,
        "description": description!,
        "product": product!,
        "rating": rating!,
        "category": category!,
    };
}
