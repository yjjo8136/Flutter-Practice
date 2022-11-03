import 'package:flutter/material.dart';
import 'package:kakaoapp/components/chat_card.dart';
import 'package:kakaoapp/models/chat.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("채팅", style: TextStyle(color: Colors.black))),
      body: ListView(
        children: List.generate(
          chats.length,
          (index) => ChatCard(chat: chats[index]),
        ),
      ),
    );
  }
}
