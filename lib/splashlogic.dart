import 'package:flutter/material.dart';
import 'package:loxtest/screens/home.dart';

Future handleSplashLogic(ctx) async {
  Future.delayed(const Duration(seconds: 7), () async {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const HomePage(),
      ),
    );
  });
}
