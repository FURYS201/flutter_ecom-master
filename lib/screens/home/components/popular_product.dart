import 'package:apptest/models/ColorProduct.dart';
import 'package:apptest/screens/see_more_product/see_more_screen.dart';
import 'package:flutter/material.dart';
import 'package:apptest/components/product_card.dart';
import 'package:apptest/models/Product.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final List<ProductApi> items;
  PopularProducts({Key? key, required this.items});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: "Sản phẩm phổ biến",
              press: () {
                Navigator.pushNamed(context, SeeMoreScreen.routeName);
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        //* Đổi thành ListView thay vì sử dụng SingleChildScrollView
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                items.length,
                (index) {
                  if (items[index].isPopular)
                    return ProductCard(product: items[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
