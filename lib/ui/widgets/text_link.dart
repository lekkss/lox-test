import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  final double size;

  // ignore: use_key_in_widget_constructors
  const TextLink(
    this.text, {
    this.onPressed,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: size,
          color: color,
        ),
      ),
    );
  }
}
