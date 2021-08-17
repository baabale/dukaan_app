import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/providers/cart.dart';
import 'package:flutter_ecommerce_app/providers/products.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductsProvider()),
        ChangeNotifierProvider.value(value: CartProvider()),
      ],
      child: DukaanApp(),
    ),
  );
}

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
      // onGenerateRoute: (settings) {
      //   if (settings.name != null) {
      //     if (settings.arguments != null) {
      //       if(settings.arguments == ProductModel){
      //         return ProductScreen()
      //       }
      //     }
      //   }
      // },
      routes: {
        HomeScreen.id: (_) => HomeScreen(),
        LoginScreen.id: (_) => LoginScreen(),
        // ProductScreen.id: (_) => ProductScreen(product: null,),
        ProductListScreen.id: (_) => ProductListScreen(),
        CategoryListScreen.id: (_) => CategoryListScreen(),
        CartScreen.id: (_) => CartScreen(),
      },
    );
  }
}
