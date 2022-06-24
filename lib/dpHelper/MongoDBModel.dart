// To parse this JSON data, do
//
//     final mongoDbModel = mongoDbModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) => MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  MongoDbModel({
    //this.id,
    this.laptopId,
    required this.company,
    required this.product,
    required this.typeName,
    required this.inches,
    required this.screenResolution,
    required this.cpu,
    required this.ram,
    required this.memory,
    required this.gpu,
    required this.opSys,
    required this.price,
  });

  //ObjectId? id;
  ObjectId? laptopId;
  String company;
  String product;
  String typeName;
  double inches;
  String screenResolution;
  String cpu;
  String ram;
  String memory;
  String gpu;
  String opSys;
  double price;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
    //id: json["_id"],
    laptopId: json["laptop_ID"].toInt(),
    company: json["Company"],
    product: json["Product"],
    typeName: json["TypeName"],
    inches: json["Inches"].toDouble(),
    screenResolution: json["ScreenResolution"],
    cpu: json["Cpu"],
    ram: json["Ram"],
    memory: json["Memory"],
    gpu: json["Gpu"],
    opSys: json["OpSys"],
    price: json["Price_euros"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    //"_id": id,
    "laptop_ID": laptopId,
    "company": company,
    "Product": product,
    "TypeName": typeName,
    "Inches": inches,
    "ScreenResolution": screenResolution,
    "Cpu": cpu,
    "Ram": ram,
    "Memory": memory,
    "Gpu": gpu,
    "OpSYS": opSys,
    "Price": price,
  };
}
