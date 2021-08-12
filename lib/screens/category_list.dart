import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/widgets/home_carousel.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({Key? key, this.categoryList}) : super(key: key);

  final List<CategoryModel>? categoryList;

  static const String id = 'CategoryListScreen';

  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  // final String endPoint =
  //     'http://192.168.1.6/projects/ecommerce/mobile/products.php';

  // Future<List<CategoryModel>> getCategories() async {
  //   List<CategoryModel> categoryList = [];
  //   try {
  //     http.Response response = await http.post(
  //       Uri.parse(endPoint),
  //       body: {
  //         'action': 'getCategories',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final List data = jsonDecode(response.body);
  //       categoryList = data.map((e) => CategoryModel.fromJson(e)).toList();
  //     } else {
  //       print(response.body);
  //     }
  //   } on SocketException {
  //     print('No Internet Access');
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return categoryList;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f9ff),
      appBar: AppBar(
        title: Text('Product Categories'),
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
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: widget.categoryList!.length,
        itemBuilder: (context, index) => CategoryCard(
          category: widget.categoryList![index],
        ),
      ),
    );
  }
}
