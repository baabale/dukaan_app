import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/screens/product.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xfff5f9ff),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(product: product),
            )),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Hero(
                    tag: product.id,
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      product.name,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        product.description,
                        style: GoogleFonts.poppins(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${product.price}',
                            style: GoogleFonts.poppins(fontSize: 20),
                            textAlign: TextAlign.end,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
