import 'package:flutter/material.dart';
import 'package:loxtest/splashlogic.dart';
import 'package:loxtest/ui/widgets/app_large_text.dart';
import 'package:loxtest/ui/widgets/app_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    handleSplashLogic(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AppText(
              text: "Entry For:",
              size: 20,
            ),
            AppLargeText(
              text: "Leksguy97@gmail.com",
              size: 30,
              color: Colors.purpleAccent,
            )
          ],
        ),
      ),
    );
  }
}
