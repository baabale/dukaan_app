import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).bottomAppBarColor,
        border: Border.all(
          color: Theme.of(context).accentColor.withOpacity(0.08),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 120,
            height: double.infinity,
            child: FlutterLogo(),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 4.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Product Name',
                              style: GoogleFonts.roboto(fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '\$',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.8),
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: '120',
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    letterSpacing: 1.2,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        CustomButton(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '01',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              letterSpacing: 1.2,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        CustomButton(),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          showDialog(
            context: context,
            // barrierDismissible: false,
            builder: (_) => AlertDialog(
              actions: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Text('Yes'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('No'),
                ),
              ],
              title: Text('Confirm'),
              content: Text(
                'Are you sure to remove this item from your cart?',
              ),
            ),
          );
        },
        child: Container(
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Icon(FontAwesomeIcons.trashAlt),
        ),
      ),
    );
  }
}
