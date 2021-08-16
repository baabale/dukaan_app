import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];

  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> productList = [];
    try {
      http.Response response = await http.post(
        Uri.parse(kEndPoint),
        body: {
          'action': 'getProducts',
        },
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        productList = data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        print(response.body);
      }
    } on SocketException {
      print('No Internet Access');
    } catch (e) {
      print(e.toString());
    }
    return productList;
  }

  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categoryList = [];
    try {
      http.Response response = await http.post(
        Uri.parse(kEndPoint),
        body: {
          'action': 'getCategories',
        },
      );

      if (response.statusCode == 200) {
        final List categories = jsonDecode(response.body);
        categoryList =
            categories.map((e) => CategoryModel.fromJson(e)).toList();
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
}
