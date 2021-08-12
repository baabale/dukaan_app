import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/cart_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  static const String id = 'CartScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CartItem(),
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                          color: Theme.of(context).accentColor.withOpacity(0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '\$',
                          style: TextStyle(
                            color:
                                Theme.of(context).accentColor.withOpacity(0.70),
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: '25',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                letterSpacing: 1.2,
                                fontSize: 23,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: OrderNowButton(
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OrderNowButton extends StatelessWidget {
  final Function() onTap;

  const OrderNowButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/bag.svg',
                width: 40,
                color: Theme.of(context).primaryColor,
                cacheColorFilter: true,
              ),
              const SizedBox(width: 15),
              Text(
                'Order Now',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Gilroy',
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
