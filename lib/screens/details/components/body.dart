import 'package:apptest/bloc/quantity_detail/cubit/quantity_detail_cubit.dart';
import 'package:apptest/bloc/quantity_detail/quantity_detail_bloc.dart';
import 'package:apptest/models/ColorProduct.dart';
import 'package:apptest/models/Product.dart';
import 'package:apptest/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:apptest/components/default_button.dart';
import 'package:apptest/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final ProductApi product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    BlocProvider(
                      create: (_) => QuantityDetailCubit(),
                      child: ColorDots(),
                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {
                            Navigator.pushNamed(context, CartScreen.routeName);
                            MotionToast.success(
                                    title: Text("Thêm thành công !"),
                                    description:
                                        Text("Đã thêm sãn phẩm vào giỏ hàng"),
                                    width: 300)
                                .show(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
