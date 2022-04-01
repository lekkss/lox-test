import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loxtest/models/message.dart';

class MessageDao {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('messages');

  void saveMessage(Message message) async {
    collection.add({
      ...message.toJson(),
    });
  }

  Stream<QuerySnapshot> getMessageStream() {
    return collection.orderBy("date").snapshots();
  }
}
