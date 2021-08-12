import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';

void main() => runApp(DukaanApp());

class DukaanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DukaanApp ',
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff5f9ff),
      ),
      routes: {
        HomeScreen.id: (_) => HomeScreen(),
        LoginScreen.id: (_) => LoginScreen(),
        ProductScreen.id: (_) => ProductScreen(),
        ProductListScreen.id: (_) => ProductListScreen(),
        CategoryListScreen.id: (_) => CategoryListScreen(),
        CartScreen.id: (_) => CartScreen(),
      },
    );
  }
}