import 'package:apptest/bloc/quantity_detail/quantity_detail_bloc.dart';
import 'package:apptest/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/ColorProduct.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.product.rating),
      ),
      body: Body(product: agrs.product),
    );
  }
}

class ProductDetailsArguments {
  final ProductApi product;

  ProductDetailsArguments({required this.product});
}
