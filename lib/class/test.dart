import 'package:flutter/material.dart';
import 'package:loxtest/ui/widgets/app_text.dart';

class WidgetDecoration extends StatefulWidget {
  const WidgetDecoration({Key? key}) : super(key: key);

  @override
  State<WidgetDecoration> createState() => _WidgetDecorationState();
}

class _WidgetDecorationState extends State<WidgetDecoration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AppText(text: "hello"),
          ],
        ),
      ),
    );
  }
}
