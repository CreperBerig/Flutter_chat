import 'package:flutter/material.dart';

import '../widgets/viev.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

  void loginMethod() {
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Icon(Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 25),
            Text('Welcome back!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18),
            ),
            SizedBox(height: 25),
            CustomTextField(hintText: 'Email', obscureText: false, controller: _emailController,),
            SizedBox(height: 10),
            CustomTextField(hintText: 'Password', obscureText: true, controller: _passwordController,),
            SizedBox(height: 10),
            CustomButton(text: 'Login',
            onTap: loginMethod,
            ),
          ],
        ),
      ),
    );
  }
}