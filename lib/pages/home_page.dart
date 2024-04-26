import 'package:flutter/material.dart';

import '../widgets/viev.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


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
    );
  }
}