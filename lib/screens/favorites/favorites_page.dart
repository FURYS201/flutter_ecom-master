import 'dart:convert';
import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:apptest/Models/cartModel.dart';
import 'package:apptest/components/coustom_bottom_nav_bar.dart';
import 'package:apptest/widget/dismissible_widget.dart';
import 'package:http/http.dart' as http;

import 'package:apptest/widget/app_bar.dart';
import 'package:apptest/Color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../enums.dart';

List<Cast> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Cast>((json) => Cast.fromMap(json)).toList();
}

Future<List<Cast>> fetchFavorites() async {
  final response = await http.get(
      Uri.parse('https://624aab21fd7e30c51c101b00.mockapi.io/ShoeListModel'));
  if (response.statusCode == 200) {
    return parseProducts(utf8.decode(response.bodyBytes));
  } else if (response.statusCode == 404) {
    throw Exception('Not Found');
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}


class MyHomePage extends StatelessWidget {
  static String routeName = "/favorites";
  final Future<List<Cast>> products;

  MyHomePage({Key? key, required this.products}) : super(key: key);

  // final items = Product.getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Cast>>(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ProductBoxList(items: snapshot.data ?? [])

                // return the ListView widget :
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.item}) : super(key: key);
  final Cast item;

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List.generate(1, (index) {
          return FadeInDown(
            duration: Duration(milliseconds: 350 * index),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: grey,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 0.5,
                              color: black.withOpacity(0.1),
                              blurRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 25, right: 25, bottom: 25),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              width: 120,
                              height: 70,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/" + this.item.image),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.item.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            this.item.price + " \$",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                          Text(
                            "x1",
                            style: TextStyle(
                                fontSize: 14,
                                color: black.withOpacity(0.5),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ProductBoxList extends StatelessWidget {
  final List<Cast> items;
  ProductBoxList({Key? key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return DismissibleWidget(
          child: ProductBox(item: items[index]),
          onDismissed: (direction) => dismissItem(context, index, direction),
          item: null,
        );
      },
    );
  }

  void dismissItem(
    BuildContext context,
    int index,
    DismissDirection direction,
  ) {}
}

