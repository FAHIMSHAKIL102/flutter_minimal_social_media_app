import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text('Social Media App')),
      body: Center(
        child: Column(
          children: [
            // logo
            Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            // app name

            // email textfield

            // password textfield

            // forgot password

            // signin button

            // don't have an account? Register here
          ],
        ),
      ),
    );
  }
}
