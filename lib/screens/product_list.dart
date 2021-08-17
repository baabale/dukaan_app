import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/providers/products.dart';
import 'package:flutter_ecommerce_app/widgets/home_carousel.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  static const String id = 'ProductListScreen';

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f9ff),
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_basket),
          ),
        ],
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, value, _) => ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: value.products.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: ProductListTile(product: value.products[index]),
          ),
        ),
      ),
    );
  }
}
