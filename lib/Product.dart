import 'package:flutter/material.dart';
class Product {
  int? id;
  String? title;
  String? description;
  String? category;
  int? price;
  int? stock;
  double? rating;
  String? brand;
  String? thumbnail;
  List<String>? images;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.stock,
    required this.rating,
    required this.brand,
    required this.thumbnail,
    required this.images,

});
}