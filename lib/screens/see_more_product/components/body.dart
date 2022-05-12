import 'package:apptest/models/Product.dart';
import 'package:apptest/screens/see_more_product/components/cart_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/Cart.dart';
import '../../../size_config.dart';
import 'list_view.dart';

class Body extends StatelessWidget {
  final Future<List<ProductApi>> products;
  Body({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: FutureBuilder<List<ProductApi>>(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListSeeMore(items: snapshot.data ?? []);
            } else if (snapshot.hasError) {
              print(snapshot.error);
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
