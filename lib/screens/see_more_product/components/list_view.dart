import 'package:apptest/screens/see_more_product/components/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/Product.dart';
import '../../../size_config.dart';

class ListSeeMore extends StatelessWidget {
  final List<ProductApi> items;
  ListSeeMore({Key? key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
      child: GridView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(8),
              vertical: getProportionateScreenHeight(8)),
          child: ProductCard(product: items[index]),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // số hàng của grid view
          // mainAxisSpacing: 20,
          // crossAxisSpacing: 20,
          // childAspectRatio: 1 // (setting khoảng cách hàng cột)
        ),
      ),
    );
  }
}
