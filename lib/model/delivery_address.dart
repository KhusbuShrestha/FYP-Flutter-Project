// To parse this JSON data, do
//
//     final deliveryAddressModel = deliveryAddressModelFromJson(jsonString);

import 'dart:convert';

DeliveryAddressModel deliveryAddressModelFromJson(String str) => DeliveryAddressModel.fromJson(json.decode(str));

String deliveryAddressModelToJson(DeliveryAddressModel data) => json.encode(data.toJson());

class DeliveryAddressModel {
    DeliveryAddressModel({
        required this.data,
    });

    List<Datum> data;

    factory DeliveryAddressModel.fromJson(Map<String, dynamic> json) => DeliveryAddressModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.region,
        this.city,
        this.area,
        this.address,
        this.userId,
    });

    int? id;
    String? region;
    String? city;
    String? area;
    String? address;
    int? userId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        region: json["region"],
        city: json["city"],
        area: json["area"],
        address: json["address"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id!,
        "region": region!,
        "city": city!,
        "area": area!,
        "address": address!,
        "user_id": userId!,
    };
}
