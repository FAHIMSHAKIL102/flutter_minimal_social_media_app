import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            // logo
            Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: 25),

            // app name
            Text('Social Media App',style: TextStyle(fontSize: 25),),
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
