// // To parse this JSON data, do
// //
// //     final productModel = productModelFromJson(jsonString);

// import 'dart:convert';

// ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

// String productModelToJson(ProductModel data) => json.encode(data.toJson());

// class ProductModel {
//     ProductModel({
//         required this.data,
//     });

//     List<Datum> data;

//     factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     Datum({
//         required this.id,
//         required this.sku,
//         required this.name,
//         required this.price,
//         required this.discount,
//         required this.sp,
//         required this.description,
//         required this.picture,
//     });

//     int id;
//     String sku;
//     String name;
//     int price;
//     int discount;
//     int sp;
//     String description;
//     String picture;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         sku: json["sku"],
//         name: json["name"],
//         price: json["price"],
//         discount: json["discount"],
//         sp: json["sp"],
//         description: json["description"],
//         picture: json["picture"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "sku": sku,
//         "name": name,
//         "price": price,
//         "discount": discount,
//         "sp": sp,
//         "description": description,
//         "picture": picture,
//     };
// }






// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
        required this.data,
    });

    List<Datum> data;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
        required this.discount,
        this.sp,
        this.description,
        this.picture,
    });

    int? id;
    String? sku;
    String? name;
    double? price;
    int? discount;
    double? sp;
    String? description;
    String? picture;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sku: json["sku"],
        name: json["name"],
        price: json["price"].toDouble(),
        discount: json["discount"] == null ? null : json["discount"],
        sp: json["sp"].toDouble(),
        description: json["description"],
        picture: json["picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id!,
        "sku": sku!,
        "name": name!,
        "price": price!,
        "discount": discount == null ? null : discount,
        "sp": sp!,
        "description": description!,
        "picture": picture!,
    };
}
