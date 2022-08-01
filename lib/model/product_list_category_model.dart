// To parse this JSON data, do
//
//     final productListCategoryModel = productListCategoryModelFromJson(jsonString);

import 'dart:convert';

ProductListCategoryModel productListCategoryModelFromJson(String str) => ProductListCategoryModel.fromJson(json.decode(str));

String productListCategoryModelToJson(ProductListCategoryModel data) => json.encode(data.toJson());

class ProductListCategoryModel {
    ProductListCategoryModel({
      required this.data,
    });

    List<Datum> data;

    factory ProductListCategoryModel.fromJson(Map<String, dynamic> json) => ProductListCategoryModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
    required this.id,
    required this.sku,
    required this.name,
    required this.price,
    required this.discount,
    required this.sp,
    required this.description,
    required this.category,
    required this.picture,
    });

    int id;
    String sku;
    String name;
    double price;
    dynamic discount;
    double sp;
    String description;
    int category;
    String picture;

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
        "id": id,
        "sku": sku,
        "name": name,
        "price": price,
        "discount": discount,
        "sp": sp,
        "description": description,
        "category": category,
        "picture": picture,
    };
}
