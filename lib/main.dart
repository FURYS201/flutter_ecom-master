import 'dart:convert';

import 'package:apptest/bloc/quantity_detail/cubit/quantity_detail_cubit.dart';
import 'package:apptest/models/Product.dart';
import 'package:apptest/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:apptest/routes.dart';
import 'package:apptest/screens/profile/profile_screen.dart';
import 'package:apptest/screens/splash/splash_screen.dart';
import 'package:apptest/network/ProductNetwork.dart';
import 'package:apptest/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'bloc/quantity_detail/quantity_detail_bloc.dart';
import 'models/transaction.dart';
import 'package:bloc/bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('products');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: BlocProvider(
        create: (_) => QuantityDetailCubit(),
        child: SplashScreen(),
      ),
      // We use routeName so that we dont need to remember the name
      // initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
// source: https://github.com/abuanwar072/E-commerce-Complete-Flutter-UI
