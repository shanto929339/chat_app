import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  var messages = [].obs;  // Reactive list to store messages

  // Fetch messages in real-time from Firestore
  Stream<QuerySnapshot> getMessages(String chatRoomId) {
    return firestore
        .collection('chats')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp')
        .snapshots();
  }

  // Send a message
  Future<void> sendMessage(String chatRoomId, String messageText) async {
    final user = auth.currentUser;
    if (user != null && messageText.isNotEmpty) {
      await firestore
          .collection('chats')
          .doc(chatRoomId)
          .collection('messages')
          .add({
        'senderID': user.uid,
        'message': messageText,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }
}
