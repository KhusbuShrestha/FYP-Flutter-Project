 
// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);
 
import 'dart:convert';
 
OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));
 
String orderModelToJson(OrderModel data) => json.encode(data.toJson());
 
class OrderModel {
    OrderModel({
        required this.data,
    });
 
    List<Datum> data;
 
    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );
 
    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}
 
class Datum {
    Datum({
        required this.id,
        required this.oCode,
        required this.total,
        required this.deliveryCharge,
        required this.grandTotal,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
    });
 
    int? id;
    String? oCode;
    double? total;
    double? deliveryCharge;
    double? grandTotal;
    int? userId;
    DateTime? createdAt;
    DateTime? updatedAt;
 
    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        oCode: json["o_code"],
        total: json["total"].toDouble(),
        deliveryCharge: json["deliveryCharge"].toDouble(),
        grandTotal: json["grandTotal"].toDouble(),
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );
 
    Map<String, dynamic> toJson() => {
        "id": id!,
        "o_code": oCode!,
        "total": total!,
        "deliveryCharge": deliveryCharge!,
        "grandTotal": grandTotal!,
        "user_id": userId!,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
