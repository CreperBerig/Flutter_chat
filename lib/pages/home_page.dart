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
          children: snapshot.data!.map<Widget>((userData) => _buildUserItem(userData, context)).toList(),
        );
      },
    );
  }

  Widget _buildUserItem(Map<String, dynamic> userData, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: UserTile(
        email: userData['email'],
        onTap: () {},
        ),
    );
  }
}