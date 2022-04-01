import 'package:flutter/material.dart';
import 'package:loxtest/ui/screens/message_list.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MessageList(),
    );
  }
}
