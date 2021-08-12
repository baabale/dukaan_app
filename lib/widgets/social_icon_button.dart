import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final Icon icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Container(width: 56, height: 56, child: icon),
      ),
    );
  }
}
