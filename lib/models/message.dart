import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String? userId;
  final String text;
  final DateTime date;
  final String? email;
  DocumentReference? reference;

  Message({
    this.userId,
    required this.text,
    required this.date,
    this.email,
    this.reference,
  });

  factory Message.fromJson(Map<dynamic, dynamic> json) {
    return Message(
      userId: json['userId'] as String?,
      text: json['text'] as String,
      date: DateTime.parse(json['date'] as String),
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date.toString(),
        'text': text,
        'email': email,
        'userId': userId,
      };

  factory Message.fromSnapshot(DocumentSnapshot snapshot) {
    final message = Message.fromJson(snapshot.data() as Map<String, dynamic>);
    message.reference = snapshot.reference;
    return message;
  }
}
