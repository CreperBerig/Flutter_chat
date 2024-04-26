import 'package:chat_app/servise/auth/auth_serves.dart';
import 'package:flutter/material.dart';

import '../widgets/viev.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Function()? togglePage;

  LoginPage({super.key, required this.togglePage});
  
  void loginMethod(BuildContext context) async{
    final authServise = AuthService();
    debugPrint('Log in button');
    try {
      await authServise.singIn(_emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString()),),
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
            Text('Welcome back!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 18),
            ),
            SizedBox(height: 25),
            CustomTextField(hintText: 'Email', obscureText: false, controller: _emailController,),
            SizedBox(height: 10),
            CustomTextField(hintText: 'Password', obscureText: true, controller: _passwordController,),
            CustomButton(text: 'Login',
            onTap: () => loginMethod(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont have an account? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                GestureDetector(
                  onTap: togglePage,
                  child: Text("Register now!",
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