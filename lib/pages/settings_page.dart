import 'package:chat_app/themes/theme_servis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: 
        Text(
          'Settings', 
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary
            ),
          )
        ),
        actions: [
          SizedBox(width: 40)
        ],
        foregroundColor: Theme.of(context).colorScheme.tertiary,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark theme",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  CupertinoSwitch(
                    value: Provider.of<ThemeServis>(context, listen: false).isDarkMode, 
                    onChanged: (value) => Provider.of<ThemeServis>(context, listen: false).toggleTheme()
                    )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}