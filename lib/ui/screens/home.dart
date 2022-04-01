import 'package:flutter/material.dart';
import 'package:loxtest/ui/screens/message_list.dart';
import 'package:loxtest/ui/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MessageList(),
                  ),
                );
              },
              child: Column(
                children: const [
                  CircleAvatar(
                    child: Icon(Icons.people),
                  ),
                  AppText(text: "Community")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
