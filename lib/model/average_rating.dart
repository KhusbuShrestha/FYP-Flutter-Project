// To parse this JSON data, do
//
//     final averageRatingModel = averageRatingModelFromJson(jsonString);
 
// import 'dart:convert';
 
// AverageRatingModel averageRatingModelFromJson(String str) => AverageRatingModel.fromJson(json.decode(str));
 
// String averageRatingModelToJson(AverageRatingModel data) => json.encode(data.toJson());
 
// class AverageRatingModel {
//     AverageRatingModel({
//         required this.averageRating,
//         required this.totalUsers,
//         required this.reviews,
//     });
 
//     double? averageRating;
//     int? totalUsers;
//     List<Review> reviews;
 
//     factory AverageRatingModel.fromJson(Map<String, dynamic> json) => AverageRatingModel(
//         averageRating: json["averageRating"].toDouble(),
//         totalUsers: json["totalUsers"],
//         reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
//     );
 
//     Map<String, dynamic> toJson() => {
//         "averageRating": averageRating!,
//         "totalUsers": totalUsers!,
//         "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
//     };
// }
 
// class Review {
//     Review({
//         required this.userId,
//         required this.review,
//     });
 
//     int? userId;
//     String? review;
 
//     factory Review.fromJson(Map<String, dynamic> json) => Review(
//         userId: json["user_id"],
//         review: json["review"],
//     );
 
//     Map<String, dynamic> toJson() => {
//         "user_id": userId!,
//         "review": review!,
//     };
// }



// new
// To parse this JSON data, do
//
//     final averageRatingModel = averageRatingModelFromJson(jsonString);

// import 'dart:convert';

// AverageRatingModel averageRatingModelFromJson(String str) => AverageRatingModel.fromJson(json.decode(str));

// String averageRatingModelToJson(AverageRatingModel data) => json.encode(data.toJson());

// class AverageRatingModel {
//     AverageRatingModel({
//       required this.averageRating,
//       required this.reviews,
//     });

//     List<AverageRating> averageRating;
//     List<Review> reviews;

//     factory AverageRatingModel.fromJson(Map<String, dynamic> json) => AverageRatingModel(
//         averageRating: List<AverageRating>.from(json["averageRating"].map((x) => AverageRating.fromJson(x))),
//         reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "averageRating": List<dynamic>.from(averageRating.map((x) => x.toJson())),
//         "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
//     };
// }

// class AverageRating {
//     AverageRating({
//         this.rating,
//         this.productId,
//     });

//     int? rating;
//     int? productId;

//     factory AverageRating.fromJson(Map<String, dynamic> json) => AverageRating(
//         rating: json["rating"],
//         productId: json["product_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "rating": rating!,
//         "product_id": productId!,
//     };
// }

// class Review {
//     Review({
//        this.userId,
//         this.review,
//     });

//     int? userId;
//     String? review;

//     factory Review.fromJson(Map<String, dynamic> json) => Review(
//         userId: json["user_id"],
//         review: json["review"],
//     );

//     Map<String, dynamic> toJson() => {
//         "user_id": userId!,
//         "review": review!,
//     };
// }


// To parse this JSON data, do
//
//     final averageRatingModel = averageRatingModelFromJson(jsonString);

// import 'dart:convert';

// AverageRatingModel averageRatingModelFromJson(String str) => AverageRatingModel.fromJson(json.decode(str));

// String averageRatingModelToJson(AverageRatingModel data) => json.encode(data.toJson());

// class AverageRatingModel {
//     AverageRatingModel({
//         required this.averageRating,
//     });

//     List<AverageRating> averageRating;

//     factory AverageRatingModel.fromJson(Map<String, dynamic> json) => AverageRatingModel(
//         averageRating: List<AverageRating>.from(json["averageRating"].map((x) => AverageRating.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "averageRating": List<dynamic>.from(averageRating.map((x) => x.toJson())),
//     };
// }

// class AverageRating {
//     AverageRating({
//         this.rating,
//         this.productId,
//     });

//     int? rating;
//     int? productId;

//     factory AverageRating.fromJson(Map<String, dynamic> json) => AverageRating(
//         rating: json["rating"],
//         productId: json["product_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "rating": rating!,
//         "product_id": productId!,
//     };
// }



// To parse this JSON data, do
//
//     final averageRatingModel = averageRatingModelFromJson(jsonString);

import 'dart:convert';

AverageRatingModel averageRatingModelFromJson(String str) => AverageRatingModel.fromJson(json.decode(str));

String averageRatingModelToJson(AverageRatingModel data) => json.encode(data.toJson());

class AverageRatingModel {
    AverageRatingModel({
        required this.reviews,
    });

    List<Review> reviews;

    factory AverageRatingModel.fromJson(Map<String, dynamic> json) => AverageRatingModel(
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    };
}

class Review {
    Review({
        this.userId,
        this.review,
    });

    int? userId;
    String? review;

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        userId: json["user_id"],
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId!,
        "review": review!,
    };
}



// To parse this JSON data, do
//
//     final averageRatingModel = averageRatingModelFromJson(jsonString);

// import 'dart:convert';

// AverageRatingModel averageRatingModelFromJson(String str) => AverageRatingModel.fromJson(json.decode(str));

// String averageRatingModelToJson(AverageRatingModel data) => json.encode(data.toJson());

// class AverageRatingModel {
//     AverageRatingModel({
//         required this.averageRating,
//     });

//     int? averageRating;

//     factory AverageRatingModel.fromJson(Map<String, dynamic> json) => AverageRatingModel(
//         averageRating: json["averageRating"],
//     );

//     Map<String, dynamic> toJson() => {
//         "averageRating": averageRating!,
//     };
// }


// To parse this JSON data, do
//
//     final averageRatingModel = averageRatingModelFromJson(jsonString);

// import 'dart:convert';

// AverageRatingModel averageRatingModelFromJson(String str) => AverageRatingModel.fromJson(json.decode(str));

// String averageRatingModelToJson(AverageRatingModel data) => json.encode(data.toJson());

// class AverageRatingModel {
//     AverageRatingModel({
//         required this.reviews,
//         required this.averageRating,
//     });

//     List<Review> reviews;
//     int? averageRating;

//     factory AverageRatingModel.fromJson(Map<String, dynamic> json) => AverageRatingModel(
//         reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
//         averageRating: json["averageRating"],
//     );

//     Map<String, dynamic> toJson() => {
//         "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
//         "averageRating": averageRating!,
//     };
// }

// class Review {
//     Review({
//         required this.userId,
//         required this.review,
//     });

//     int? userId;
//     String? review;

//     factory Review.fromJson(Map<String, dynamic> json) => Review(
//         userId: json["user_id"],
//         review: json["review"],
//     );

//     Map<String, dynamic> toJson() => {
//         "user_id": userId!,
//         "review": review!,
//     };
// }
