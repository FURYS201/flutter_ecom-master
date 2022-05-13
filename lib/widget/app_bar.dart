import 'package:apptest/screens/favorites/favorites_page.dart';
//import 'package:apptest/screens/menu_page.dart';
import 'package:apptest/Color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'menu_page.dart';

Widget getAppBar(context) {
  return AppBar(
    elevation: 0,
    backgroundColor: white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            icon: SvgPicture.asset("assets/images/burger_icon.svg"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true, builder: (_) => MenuPage()));
            }),
        Row(
          children: <Widget>[
            IconButton(
                icon: SvgPicture.asset("assets/images/search_icon.svg"),
                onPressed: () {}),
            IconButton(
                icon: SvgPicture.asset("assets/images/filter_icon.svg"),
                onPressed: () {}),
            IconButton(
                icon: Container(
                  child: Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                          color: white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  decoration:
                      BoxDecoration(color: black, shape: BoxShape.circle),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MyHomePage(
                                products: fetchFavorites(),
                              )));
                }),
          ],
        )
      ],
    ),
  );
}
