import 'package:chat_app/servise/auth/auth_serves.dart';
import 'package:chat_app/servise/chat/chat_servise.dart';
import 'package:flutter/material.dart';

import '../widgets/viev.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatServis _chatServis = ChatServis();
  final AuthService _authService = AuthService();

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
      ),
      drawer: CustomDrawer(),
      body: _buildUsersList(),
    );
    
  }

  Widget _buildUsersList() {
    return StreamBuilder(
      stream: _chatServis.getUsers(),
      builder: (context, snapshot) {
          if (snapshot.hasError){
            return Text('Error!');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Waiting...");
          }

          /*return ListView(
            children: snapshot.data!.map<Widget>((userData) => _buildUserItem).toList(),
          );*/
        },
      );
  }

  Widget _buildUserItem(Map<String, dynamic> userData, BuildContext context) {
    return ListTile();
  }
}