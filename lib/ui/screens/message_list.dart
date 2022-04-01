import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loxtest/models/message.dart';
import 'package:loxtest/services/message_dao.dart';
import 'package:loxtest/services/user_dao.dart';
import 'package:loxtest/ui/widgets/message_widget.dart';
// import 'package:free_chat_app/ui/views/login_screen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MessageList extends StatefulWidget {
  MessageList({
    Key? key,
  }) : super(key: key);

  @override
  MessageListState createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String? email, userId;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToBottom());
    final messageDao = Provider.of<MessageDao>(context, listen: false);
    final userDao = Provider.of<UserDao>(context, listen: false);
    email = userDao.email();
    userId = userDao.userId();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0XFFEBEBEB),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30,
          ),
        ),
        title: Text(
          email!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
            size: 18,
          ),
          Icon(
            Icons.more_vert_rounded,
            color: Colors.black,
            size: 18,
          ),
          SizedBox(
            width: 20,
          )
          // IconButton(
          //   onPressed: () {
          //     userDao.logout();
          //     // Navigator.of(context).push(
          //     //   MaterialPageRoute(
          //     //     builder: (BuildContext context) => const LoginScreen(),
          //     //   ),
          //     // );
          //   },
          //   icon: const Icon(
          //     Icons.logout,
          //     color: Colors.black,
          //     size: 18,
          //   ),
          // )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          children: [
            // widget.isBlocked
            //     ? Container(
            //         width: double.infinity,
            //         color: const Color(0XFFFFF9F4),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Row(
            //             children: [
            //               const Text(
            //                 "⚠️ You have blocked this user!!",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(color: Colors.red),
            //               ),
            //               const Spacer(),
            //               IconButton(
            //                 onPressed: () {
            //                   setState(() {
            //                     widget.isBlocked = false;
            //                   });
            //                 },
            //                 icon: const Icon(
            //                   Icons.cancel,
            //                   color: Colors.red,
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       )
            //     : Container(),
            _getMessageList(messageDao),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _messageController,
                      onSubmitted: (input) {
                        _sendMessage(messageDao);
                      },
                      decoration: InputDecoration(
                          hintText: 'New message',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Color(0X3BDCDCDC),
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _canSendMessage()
                                  ? CupertinoIcons.add
                                  : Icons.send,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              _sendMessage(messageDao);
                            },
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(MessageDao messageDao) {
    if (_canSendMessage()) {
      final message = Message(
        userId: userId,
        text: _messageController.text,
        date: DateTime.now(),
        email: email,
      );
      messageDao.saveMessage(message);
      _messageController.clear();
      setState(() {});
    }
  }

  Widget _getMessageList(MessageDao messageDao) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: messageDao.getMessageStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return _buildList(context, snapshot.data!.docs);
        },
      ),
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {
    return ListView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 20.0),
      // 2
      children: snapshot!.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final message = Message.fromSnapshot(snapshot);
    return Align(
      alignment: message.userId == userId
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: MessageWidget(
        message: message,
        isMe: message.userId == userId,
      ),
    );
  }

  bool _canSendMessage() => _messageController.text.isNotEmpty;

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}
