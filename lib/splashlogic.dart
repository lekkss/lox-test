import 'package:flutter/material.dart';
import 'package:loxtest/services/user_dao.dart';
import 'package:loxtest/ui/screens/home.dart';
import 'package:loxtest/ui/screens/login_screen.dart';
import 'package:provider/provider.dart';

Future handleSplashLogic(ctx) async {
  Future.delayed(const Duration(seconds: 7), () async {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => Consumer<UserDao>(
          builder: (context, userDao, child) {
            if (userDao.isLoggedIn()) {
              return const HomePage();
            } else {
              return const LogInScreen();
            }
          },
        ),
      ),
    );
  });
}
