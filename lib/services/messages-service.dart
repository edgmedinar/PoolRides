import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pool_rides/models/message.dart';
import 'package:pool_rides/services/auth-service.dart';

class MessagesService {
  final _cFirestore = FirebaseFirestore.instance;

  static final MessagesService _messagesService =
      new MessagesService._internal();

  MessagesService._internal();
  factory MessagesService() {
    return _messagesService;
  }

  Future<bool> addMessage(String conversationId, String message) async {
    try {
      final String uid = UserAuthProvider().getUid();

      ChatMessage msg = ChatMessage(
          messageContent: message.trim(),
          messageSender: uid,
          date: DateTime.now());

      DocumentReference ref =
          _cFirestore.collection('conversations').doc(conversationId);

      Map<String, dynamic> messageMap = msg.toMap();
      await ref.update({'lastMessage': messageMap});

      await ref.collection('messages').add(messageMap);
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<QuerySnapshot> getMessages(String conversationId) {
    try {
      return _cFirestore
          .collection('conversations')
          .doc(conversationId)
          .collection('messages')
          .orderBy('date')
          .snapshots();
    } catch (e) {
      return null;
    }
  }
}