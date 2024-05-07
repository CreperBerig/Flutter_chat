import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/servise/auth/auth_serves.dart';
import 'package:chat_app/servise/chat/chat_servise.dart';
import 'package:flutter/material.dart';

import '../widgets/viev.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatServis = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(
          'home page',
          style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary
            ),
          )
        ),
        foregroundColor: Theme.of(context).colorScheme.tertiary,
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          SizedBox(width: 40)
        ],
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: snapshot.data!.map<Widget>((userData) => _buildUserItem(userData, context)).toList(),
        );
      },
    );
  }

  Widget _buildUserItem(Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != _authService.getCurrentUser()!.email){
      return Container(
        child: UserTile(
          email: userData['email'],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatPage(
                receiverEmail: userData['email'],
                receiverID: userData['uid'],
              ))
            );
          },
        ),
      );
    } else {
      return Container();
    }
  }
}