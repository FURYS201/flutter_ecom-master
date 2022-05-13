import 'package:apptest/screens/favorites/favorites_page.dart';
import 'package:apptest/screens/hive/hive_screen.dart';
import 'package:apptest/screens/see_more_product/see_more_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:apptest/screens/cart/cart_screen.dart';
import 'package:apptest/screens/complete_profile/complete_profile_screen.dart';
import 'package:apptest/screens/details/details_screen.dart';
import 'package:apptest/screens/forgot_password/forgot_password_screen.dart';
import 'package:apptest/screens/home/home_screen.dart';
import 'package:apptest/screens/login_success/login_success_screen.dart';
import 'package:apptest/screens/otp/otp_screen.dart';
import 'package:apptest/screens/profile/profile_screen.dart';
import 'package:apptest/screens/sign_in/sign_in_screen.dart';
import 'package:apptest/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(products: fetchProducts()),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SeeMoreScreen.routeName: (context) => SeeMoreScreen(products: fetchApi()),
  HiveScreen.routeName: (context) => HiveScreen(),
  MyHomePage.routeName: (context) => MyHomePage(products: fetchFavorites()),
};
