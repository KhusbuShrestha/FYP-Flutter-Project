// // To parse this JSON data, do
// //
// //     final wishlistModel = wishlistModelFromJson(jsonString);

// import 'dart:convert';

// WishlistModel wishlistModelFromJson(String str) => WishlistModel.fromJson(json.decode(str));

// String wishlistModelToJson(WishlistModel data) => json.encode(data.toJson());

// class WishlistModel {
//     WishlistModel({
//       required this.data,
//     });

//     List<Datum> data;

//     factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     Datum({
//         this.id,
//         this.name,
//         this.sp,
//         this.product,
//         this.user,
//         this.picture,
//     });

//     int? id;
//     String? name;
//     double? sp;
//     int? product;
//     int? user;
//     String? picture;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         name: json["name"],
//         sp: json["sp"].toDOuble(),
//         product: json["product"],
//         user: json["user"],
//         picture: json["picture"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id!,
//         "name": name!,
//         "sp": sp!,
//         "product": product!,
//         "user": user!,
//         "picture": picture!,
//     };
// }




// To parse this JSON data, do
//
//     final wishlistModel = wishlistModelFromJson(jsonString);

import 'dart:convert';

WishlistModel wishlistModelFromJson(String str) => WishlistModel.fromJson(json.decode(str));

String wishlistModelToJson(WishlistModel data) => json.encode(data.toJson());

class WishlistModel {
    WishlistModel({
        required this.data,
    });

    List<Datum> data;

    factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
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
        this.product,
        this.user,
        this.picture,
    });

    int? id;
    String? name;
    double? sp;
    int? product;
    int? user;
    String? picture;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        sp: json["sp"].toDouble(),
        product: json["product"],
        user: json["user"],
        picture: json["picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id!,
        "name": name!,
        "sp": sp!,
        "product": product!,
        "user": user!,
        "picture": picture!,
    };
}
