// // To parse this JSON data, do
// //
// //     final categoryModel = categoryModelFromJson(jsonString);

// import 'dart:convert';

// List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

// String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class CategoryModel {
//     CategoryModel({
//        this.id,
//        this.name,
//        this.createdAt,
//        this.updatedAt,
//     });

//     int? id;
//     String? name;
//     DateTime? createdAt;
//     DateTime? updatedAt;

//     factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
//         id: json["id"],
//         name: json["name"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id!,
//         "name": name!,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//     };
// }
// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

// import 'dart:convert';

// CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

// String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

// class CategoryModel {
//     CategoryModel({
//       required this.data,
//     });

//     List<Datum> data;

//     factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     Datum({
//     required this.id,
//     required this.name,
//     required this.createdAt,
//     });

//     int id;
//     String name;
//     String createdAt;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         name: json["name"],
//         createdAt: json["created_at"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "created_at": createdAt,
//     };
// }
// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    CategoryModel({
       required this.data,
    });

    List<Datum> data;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
      required this.id,
      required this.name,
      required this.image,
      required this.createdAt,
    });

    int id;
    String name;
    String image;
    String createdAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "created_at": createdAt,
    };
}

