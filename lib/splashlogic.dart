import 'package:flutter/material.dart';
import 'package:loxtest/ui/widgets/screens/home.dart';
import 'package:loxtest/ui/widgets/screens/sign_up_screen.dart';

Future handleSplashLogic(ctx) async {
  Future.delayed(const Duration(seconds: 7), () async {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const SignUpScreen(),
      ),
    );
  });
}
