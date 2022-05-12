import 'dart:convert';

import 'package:apptest/models/Product.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';
import 'package:http/http.dart' as http;

const String url = 'https://62553f0f8646add390d34f2b.mockapi.io/products';

List<ProductApi> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ProductApi>((model) => ProductApi.fromMap(model)).toList();
}

Future<List<ProductApi>> fetchApi() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return parseProducts(utf8.decode(response.bodyBytes));
  } else if (response.statusCode == 404) {
    throw Exception('Not Found');
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

class SeeMoreScreen extends StatelessWidget {
  static String routeName = "/see_more_product";
  final Future<List<ProductApi>> products;
  SeeMoreScreen({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sản Phẩm Phổ Biến",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(products: products),
    );
  }
}
