import 'package:flutter/material.dart';
import 'package:apptest/components/default_button.dart';
import 'package:apptest/screens/home/home_screen.dart';
import 'package:apptest/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
         //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Đăng Nhập Thành Công",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Về trang chủ",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
