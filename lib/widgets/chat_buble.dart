import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final String sender;
  final String data;
  const ChatBubble({
    super.key,
    required this.isCurrentUser,
    required this.message,
    required this.data,
    required this.sender,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: isCurrentUser? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: isCurrentUser? Radius.circular(12) : Radius.circular(2),
                bottomRight: isCurrentUser? Radius.circular(2) : Radius.circular(12)
                ),
              color: isCurrentUser? Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.tertiary,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: isCurrentUser? Color.fromRGBO(226, 226, 234, 1) : Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Text(
                  data,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )
        ],
      ),
    );
  }
}