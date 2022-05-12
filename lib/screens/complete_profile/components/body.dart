import 'package:flutter/material.dart';
import 'package:apptest/constants.dart';
import 'package:apptest/size_config.dart';

import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Thông Tin Cá Nhân", style: headingStyle),
                Text(
                  "Hoàn thành thông tin chi tiết của bạn hoặc tiếp tục  \nvới mạng xã hội",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                CompleteProfileForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "Bằng cách tiếp tục xác nhận rằng bạn đồng ý \nvới Điều khoản và Điều kiện của chúng tôi",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
