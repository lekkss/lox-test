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
          // if (!widget.isMe && widget.message.flagged!) ...[
          //   Container(
          //     color: Colors.white,
          //     margin: const EdgeInsets.only(top: 10),
          //     width: MediaQuery.of(context).size.width,
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Column(
          //         children: [
          //           const Text(
          //             "Note: You are being bullied!!",
          //             style: TextStyle(
          //                 color: Colors.blue, fontWeight: FontWeight.bold),
          //           ),
          //           const SizedBox(
          //             height: 20,
          //           ),
          //           Text(
          //             "${widget.message.email} uses inappropriate word \"${widget.message.text}\" in this conversation with you I pressume \"${widget.message.email}\"  to be a bully\nBut we have informed him",
          //             textAlign: TextAlign.center,
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           const Text(
          //             "Will you like to",
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           Row(
          //             children: [
          //               Expanded(
          //                 child: AppButtons(
          //                   text: 'Take Action',
          //                   color: Colors.white,
          //                   size: 20,
          //                   height: 48,
          //                   backgroundColor: Colors.red,
          //                   borderColor: Colors.red,
          //                   onPressed: () {
          //                     Navigator.of(context).pushReplacement(
          //                       MaterialPageRoute(
          //                         builder: (BuildContext context) =>
          //                             TakeActionScreenA(
          //                           message: widget.message,
          //                         ),
          //                       ),
          //                     );
          //                   },
          //                 ),
          //               ),
          //               const SizedBox(width: 8),
          //               Expanded(
          //                 child: AppButtons(
          //                   text: 'Continue',
          //                   color: Colors.red,
          //                   size: 20,
          //                   height: 48,
          //                   backgroundColor: Colors.white,
          //                   borderColor: Colors.red,
          //                   onPressed: () {
          //                     Navigator.of(context).push(
          //                       MaterialPageRoute(
          //                         builder: (BuildContext context) =>
          //                             ContinueChat(
          //                           message: widget.message,
          //                         ),
          //                       ),
          //                     );
          //                   },
          //                 ),
          //               ),
          //             ],
          //           )
          //         ],
          //       ),
          //     ),
          //   )
          // ],
          // if (widget.isMe && widget.message.flagged!) ...[
          //   showCont == true
          //       ? Container(
          //           width: double.infinity,
          //           color: Colors.white,
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Column(
          //                   children: const [
          //                     Text(
          //                       "Warning: Inappropriate words found",
          //                       style: TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: 10,
          //                     ),
          //                     Text(
          //                       "Your Message contains abusive words, it can\ntrigger your account to be suspended.",
          //                       textAlign: TextAlign.center,
          //                     ),
          //                   ],
          //                 ),
          //                 IconButton(
          //                     onPressed: () {
          //                       setState(() {
          //                         showCont = false;
          //                       });
          //                     },
          //                     icon: const Icon(Icons.cancel_outlined))
          //               ],
          //             ),
          //           ),
          //         )
          //       : Container()
          // ]
        ],
      ),
    );
  }
}
