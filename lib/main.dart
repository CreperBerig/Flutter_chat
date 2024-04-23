import 'package:chat_app/themes/litht_theme.dart';
import 'package:flutter/material.dart';

import 'pages/login_page.dart';

void main() {
  runApp(Chat());
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ligthMode,
      home: LoginPage(),
    );
  }
}