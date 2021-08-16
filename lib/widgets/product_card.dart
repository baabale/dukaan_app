import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/screens/product.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Material(
        color: Color(0xfff5f9ff),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, ProductScreen.id),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.name,
                  style: GoogleFonts.poppins(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  '\$${product.price}',
                  style: GoogleFonts.poppins(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
