// To parse this JSON data, do
//
//     final productApi = productApiFromMap(jsonString);

import 'dart:convert';

List<ProductApi> productApiFromMap(String str) =>
    List<ProductApi>.from(json.decode(str).map((x) => ProductApi.fromMap(x)));

String productApiToMap(List<ProductApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProductApi {
  ProductApi({
    required this.images,
    required this.title,
    required this.description,
    this.rating = '0.0',
    required this.price,
    this.isFavourite = false,
    this.isPopular = false,
    required this.id,
  });

  List<String> images;
  String title;
  String description;
  String rating;
  String price;
  bool isFavourite;
  bool isPopular;
  String id;

  factory ProductApi.fromMap(Map<String, dynamic> json) => ProductApi(
        images: List<String>.from(json["images"].map((x) => x)),
        title: json["title"],
        description: json["description"],
        rating: json["rating"],
        price: json["price"],
        isFavourite: json["isFavourite"],
        isPopular: json["isPopular"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "images": List<dynamic>.from(images.map((x) => x)),
        "title": title,
        "description": description,
        "rating": rating,
        "price": price,
        "isFavourite": isFavourite,
        "isPopular": isPopular,
        "id": id,
      };
}
