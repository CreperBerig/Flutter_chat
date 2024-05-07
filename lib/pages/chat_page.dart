import 'dart:collection';

import 'package:chat_app/widgets/viev.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../servise/auth/auth.dart';
import '../servise/chat/chat_servise.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  final TextEditingController _controller = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _chatService.sendMessage(_controller.text, receiverID);
    }
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: 
        Text(
          receiverEmail,
          style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary
            ),
          )),
        foregroundColor: Theme.of(context).colorScheme.tertiary,
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          SizedBox(width: 40)
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList(context)),
          _buildTextField(context),
        ],
      ),
    );
  }

  Widget _buildMessageList(BuildContext context) {
    String currentUserID = _authService.getCurrentUser()!.uid;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: StreamBuilder(
        stream: _chatService.getMessage(currentUserID, receiverID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10,),
                  Text('Error! data not loading',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            );
          }
      
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  SizedBox(height: 10),
                  Text('Loading data',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    )
                  )
                ],
              ),
            );
          }
      
          return ListView(
            children: snapshot.data!.docs
                .map((message) => _buildMessageItem(message, context))
                .toList(),
          );
        },
      ),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot message, BuildContext context) {
    Map<String, dynamic> data = message.data() as Map<String, dynamic>;
    bool isCurrentUser = data["senderID"] == _authService.getCurrentUser()!.uid;

    final Timestamp timestamp = data["timestamp"] as Timestamp;
    final date = timestamp.toDate();
    final formattedDate = DateFormat('HH:mm MM.dd').format(date).toString();

    return ChatBubble(
      isCurrentUser: isCurrentUser,
      message: data["message"],
      data: formattedDate,
      sender: data["senderEmail"]
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              hintText: "Enter a message",
              obscureText: false,
              controller: _controller,
            ),
          ),
          GestureDetector(
            onTap: sendMessage,
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.send,
                color: Theme.of(context).colorScheme.primary,
              )
            ),
          )
        ],
      ),
    );
  }
}