// To parse this JSON data, do
//
//     final orderDescModel = orderDescModelFromJson(jsonString);
 
import 'dart:convert';
 
OrderDescModel orderDescModelFromJson(String str) => OrderDescModel.fromJson(json.decode(str));
 
String orderDescModelToJson(OrderDescModel data) => json.encode(data.toJson());
 
class OrderDescModel {
    OrderDescModel({
        required this.data,
    });
 
    List<Datum> data;
 
    factory OrderDescModel.fromJson(Map<String, dynamic> json) => OrderDescModel(
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
        required this.quantity,
        required this.amount,
        required this.orderId,
        required this.productId,
        required this.createdAt,
        required this.updatedAt,
    });
 
    int? id;
    String? name;
    double? quantity;
    double? amount;
    int? orderId;
    int? productId;
    DateTime? createdAt;
    DateTime? updatedAt;
 
    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"].toDouble(),
        amount: json["amount"].toDouble(),
        orderId: json["order_id"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );
 
    Map<String, dynamic> toJson() => {
        "id": id!,
        "name": name!,
        "quantity": quantity!,
        "amount": amount!,
        "order_id": orderId!,
        "product_id": productId!,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
