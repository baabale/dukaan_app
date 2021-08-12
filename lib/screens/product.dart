import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';
import 'package:flutter_ecommerce_app/widgets/custom_flat_button.dart';
import 'package:flutter_ecommerce_app/widgets/product_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  static const String id = 'ProductScreen';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f9ff),
      appBar: AppBar(
        title: Text('Product Name'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, CartScreen.id),
            icon: Icon(Icons.shopping_basket),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: CachedNetworkImage(
              imageUrl:
                  'https://s3.eu-west-1.amazonaws.com/prod.news.product.which.co.uk/news/wp-content/uploads/2021/06/MAIN-13.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        'Products Name',
                        style: GoogleFonts.poppins(fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text.rich(
                        TextSpan(
                          text: '\$',
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w300,
                          ),
                          children: [
                            TextSpan(
                              text: '120',
                              style: GoogleFonts.poppins(
                                fontSize: 32,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis semper fermentum ipsum non feugiat. Suspendisse potenti. Donec tristique rutrum nisi, non accumsan dui. Mauris vel dui non lorem mollis viverra sed pretium metus. Integer ac elit nunc. Sed ultrices, nunc posuere malesuada eleifend, purus eros maximus ligula, at interdum urna elit sit amet massa. Vivamus nisl diam, imperdiet et mollis ullamcorper, interdum id libero.',
                  style: GoogleFonts.poppins(fontSize: 13),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recommended',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, ProductScreen.id),
                            child: Text(
                              'View all',
                              style: GoogleFonts.poppins(),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: ProductCard(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Material(
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: LikeButton(
                      // onTap: (val) async {
                      //   return true;
                      // },
                      isLiked: true,
                      size: 40,
                      circleColor: CircleColor(
                        start: Color(0xff00ddff),
                        end: Color(0xff0099cc),
                      ),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.red,
                        dotSecondaryColor:
                            Theme.of(context).primaryColor.withOpacity(0.15),
                      ),
                      likeBuilder: (bool isLiked) => Icon(
                        Icons.favorite,
                        color: isLiked
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                        size: 40,
                      ),
                      likeCount: 0,
                      countBuilder: (count, isLiked, text) => Text(''),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: CustomFlatButton(
                label: 'Add to Cart',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
