import 'package:chat_app/auth/auth_serves.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logOut() {
    final _auth = AuthService();
    _auth.singOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(
          'home page', 
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary
          ),)
        ),
        actions: [
          IconButton(onPressed: logOut, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}