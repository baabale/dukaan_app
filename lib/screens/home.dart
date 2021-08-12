import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';
import 'package:flutter_ecommerce_app/widgets/home_carousel.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String endPoint =
      'http://192.168.1.6/projects/ecommerce/mobile/products.php';

  List<CategoryModel> data = [];

  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categoryList = [];
    try {
      http.Response response = await http.post(
        Uri.parse(endPoint),
        body: {
          'action': 'getCategories',
        },
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        categoryList = data.map((e) => CategoryModel.fromJson(e)).toList();
      } else {
        print(response.body);
      }
    } on SocketException {
      print('No Internet Access');
    } catch (e) {
      print(e.toString());
    }
    return categoryList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Dukaan App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, CartScreen.id),
            icon: Icon(Icons.shopping_basket),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          HomeCarousel(
            images: [
              'https://www.taylorandscott.com.au/wp-content/uploads/2016/06/iStock_000081037361_Large-1024x680.jpg',
              'https://s3.eu-west-1.amazonaws.com/prod.news.product.which.co.uk/news/wp-content/uploads/2021/06/MAIN-13.jpg',
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Categories',
                        style: GoogleFonts.poppins(),
                      ),
                      TextButton(
                        onPressed: () {
                          if (data.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CategoryListScreen(
                                  categoryList: data,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'View all',
                          style: GoogleFonts.poppins(),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 96,
                  width: double.infinity,
                  child: FutureBuilder<List<CategoryModel>>(
                    future: getCategories(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if (snapshot.data != null) {
                            data = snapshot.data!;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              itemCount: data.length,
                              itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: CategoryCard(
                                  category: data[index],
                                ),
                              ),
                            );
                          } else {
                            return Center(child: Text('No Data Found.'));
                          }
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Latest Products',
                        style: GoogleFonts.poppins(),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          ProductListScreen.id,
                        ),
                        child: Text(
                          'View all',
                          style: GoogleFonts.poppins(),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 210,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    itemCount: 5,
                    itemBuilder: (context, index) => ProductCard(),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Electronics',
                        style: GoogleFonts.poppins(),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          ProductListScreen.id,
                        ),
                        child: Text(
                          'View all',
                          style: GoogleFonts.poppins(),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 210,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    itemCount: 5,
                    itemBuilder: (context, index) => ProductCard(),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
