// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/Product.dart';

// class ProductNetwork {
//   static const String url =
//       'https://62553f0f8646add390d34f2b.mockapi.io/products';

//   static List<Product> parseProducts(String responseBody) {
//     final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//     return parsed.map<Product>((model) => Product.fromJson(model)).toList();
//   }

//   static Future<List<Product>> fetchProducts() async {
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       return parseProducts(response.body);
//     } else if (response.statusCode == 404) {
//       throw Exception('Not Found');
//     } else {
//       throw Exception('Unable to fetch products from the REST API');
//     }
//   }
// }
