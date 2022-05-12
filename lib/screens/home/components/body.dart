import 'package:flutter/material.dart';

import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  final Future<List<ProductApi>> products;
  Body({Key? key, required this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Center(
              child: FutureBuilder<List<ProductApi>>(
                future: products,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return PopularProducts(items: snapshot.data ?? []);
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
