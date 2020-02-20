import 'package:flutter/material.dart';

class Support with ChangeNotifier {
  List _messages = [];

  List get messages {
    return [..._messages];
  }

  void sendMessage(String message) {
    _messages.add(message);
    notifyListeners();
  }
}
