import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton({
    Key? key,
    required this.onTap,
    this.label,
    this.isPreferable = false,
  }) : super(key: key);

  final Function onTap;
  final String? label;
  final bool isPreferable;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap as void Function()?,
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
              ),
              const SizedBox(width: 15),
              Text(
                label ?? '',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
