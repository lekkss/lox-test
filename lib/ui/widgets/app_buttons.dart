import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final bool? isIcon;
  final void Function()? onPressed;
  final String? text;
  final IconData? icon;
  final Color color;
  final Color backgroundColor;
  final double size;
  final double height;
  final Color borderColor;
  const AppButtons(
      {Key? key,
      this.onPressed,
      this.isIcon = false,
      this.text = "hi",
      this.icon,
      required this.color,
      required this.size,
      required this.height,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(
              18,
            ),
            color: backgroundColor),
        child: isIcon == false
            ? Center(
                child: Text(
                  text!,
                  style: TextStyle(
                    color: color,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Center(
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
      ),
    );
  }
}
