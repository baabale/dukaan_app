import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xfff5f9ff),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {},
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
                  child: FlutterLogo(),
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
                      'Products Name',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis semper fermentum ipsum non feugiat. Suspendisse potenti. Donec tristique rutrum nisi, non accumsan dui. Mauris vel dui non lorem mollis viverra sed pretium metus. Integer ac elit nunc. Sed ultrices, nunc posuere malesuada eleifend, purus eros maximus ligula, at interdum urna elit sit amet massa. Vivamus nisl diam, imperdiet et mollis ullamcorper, interdum id libero.',
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
                            '\$120',
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
