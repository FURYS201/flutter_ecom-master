import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:apptest/components/coustom_bottom_nav_bar.dart';
import 'package:apptest/enums.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'package:http/http.dart' as http;

const String url = 'https://62553f0f8646add390d34f2b.mockapi.io/products';

List<ProductApi> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ProductApi>((model) => ProductApi.fromMap(model)).toList();
}

Future<List<ProductApi>> fetchProducts() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return parseProducts(utf8.decode(response.bodyBytes));
  } else if (response.statusCode == 404) {
    throw Exception('Not Found');
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  final Future<List<ProductApi>> products;

  HomeScreen({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(products: products),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
