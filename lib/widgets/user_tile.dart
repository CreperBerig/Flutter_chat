import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String email;
  final void Function()? onTap;
  const UserTile({super.key, required this.email, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [BoxShadow(
            color: Theme.of(context).colorScheme.secondary,
            spreadRadius: -8,
            blurRadius: 25,
            offset: Offset(0, 5),
          )]
        ),
        child: Row(
          children: [
            Icon(Icons.person,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            SizedBox(width: 10),
            Text(email,
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.w500,
                fontSize: 18
              ),
            )
          ],
        ),
      ),
    );
  }
}