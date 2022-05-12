import 'package:apptest/constants.dart';
import 'package:apptest/models/ColorProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:apptest/models/Product.dart';
import 'package:apptest/screens/details/details_screen.dart';

import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, this.width = 140, required this.product})
      : super(key: key);

  final double width;
  final ProductApi product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 10.0)
          ]),
      child: SizedBox(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: product),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Flexible một dạng bõ chữa items
              // link fix lỗi pixel: https://www.youtube.com/watch?v=nRm18oPR5z4
              Flexible(
                flex: 3,
                child: Center(
                  child: Hero(
                    tag: this.product.id.toString(),
                    child: Image.asset(
                      this.product.images[0],
                      height: getProportionateScreenHeight(200),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Flexible(
                  flex: 3,
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 145.0,
                        child: Text(
                          this.product.title,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${this.product.price}",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              fontWeight: FontWeight.w600,
                              color: kPrimaryColor,
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(8)),
                              height: getProportionateScreenWidth(28),
                              width: getProportionateScreenWidth(28),
                              decoration: BoxDecoration(
                                color: this.product.isFavourite
                                    ? kPrimaryColor.withOpacity(0.15)
                                    : kSecondaryColor.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/Heart Icon_2.svg",
                                color: this.product.isFavourite
                                    ? Color(0xFFFF4848)
                                    : Color(0xFFDBDEE4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))),
            ],
          ),
        ),
      ),
    ));
  }
}


// link tham khảo fix bug card items