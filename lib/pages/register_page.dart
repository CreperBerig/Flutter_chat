import 'package:chat_app/auth/auth_serves.dart';
import 'package:flutter/material.dart';

import '../widgets/viev.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final Function()? togglePage;

  RegisterPage({super.key, required this.togglePage});

  void registerMethod(BuildContext context) {
    debugPrint('Register button');
    final _auth = AuthService();

    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        _auth.singUp(_emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString()),),
      );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text('Password dont match'))
      );
    }
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
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 25),
            Text('Create new accont',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 18),
            ),
            SizedBox(height: 25),
            CustomTextField(hintText: 'Email', obscureText: false, controller: _emailController,),
            SizedBox(height: 10),
            CustomTextField(hintText: 'Password', obscureText: true, controller: _passwordController,),
            SizedBox(height: 10),
            CustomTextField(hintText: 'Confirm password', obscureText: true, controller: _confirmPasswordController,),
            CustomButton(text: 'Register',
            onTap: () => registerMethod(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Alredt have an account? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                GestureDetector(
                  onTap: togglePage,
                  child: Text("Log in!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}