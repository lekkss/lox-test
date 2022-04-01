import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loxtest/models/message.dart';

class MessageWidget extends StatefulWidget {
  // final String message;
  // final DateTime date;
  // final String? email;
  final Message message;
  final bool isMe;

  const MessageWidget({
    Key? key,
    required this.message,
    this.isMe = true,
  }) : super(key: key);

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  late bool showCont = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 1,
        top: 5,
        right: 1,
        bottom: 2,
      ),
      child: Column(
        crossAxisAlignment:
            widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (widget.message.email != null) ...[
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                widget.message.email!,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
          widget.isMe
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: widget.isMe
                          ? const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(4),
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(4),
                              ),
                              color: Colors.grey,
                            )
                          : const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(4),
                                bottomRight: Radius.circular(16),
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(16),
                              ),
                              color: Color(0XFFE9EAEE),
                            ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 8.0,
                          bottom: 8,
                        ),
                        child: Text(
                          widget.message.text,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    widget.isMe &&
                            FirebaseAuth.instance.currentUser!.photoURL != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              FirebaseAuth.instance.currentUser!.photoURL!,
                              width: 30,
                            ),
                          )
                        : CircleAvatar(
                            child: Text(
                              widget.message.email!
                                  .substring(0, 2)
                                  .toUpperCase(),
                            ),
                          ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widget.isMe &&
                            FirebaseAuth.instance.currentUser!.photoURL != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              FirebaseAuth.instance.currentUser!.photoURL!,
                              width: 30,
                            ),
                          )
                        : CircleAvatar(
                            child: Text(
                              widget.message.email!
                                  .substring(0, 2)
                                  .toUpperCase(),
                            ),
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: widget.isMe
                          ? const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(4),
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(4),
                              ),
                              color: Colors.grey,
                            )
                          : const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(4),
                                bottomRight: Radius.circular(16),
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(16),
                              ),
                              color: Color(0XFFE9EAEE),
                            ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 8.0,
                          bottom: 8,
                        ),
                        child: Text(
                          widget.message.text,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              DateFormat('kk:mma').format(widget.message.date).toString(),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
