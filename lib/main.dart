import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
        routes: {"/homepage": (context) => HomePage()},
      ),
    );
  }
}
