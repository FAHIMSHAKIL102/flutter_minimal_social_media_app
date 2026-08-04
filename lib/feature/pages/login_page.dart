import 'package:flutter/material.dart';
import 'package:flutter_minimal_social_media_app/widget/my_button.dart';
import 'package:flutter_minimal_social_media_app/widget/my_textformfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
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
              Text('Social Media App', style: TextStyle(fontSize: 25)),
              SizedBox(height: 25),
              // email textfield
              MyTextformfield(
                hintText: 'Email',
                obscureText: false,
                controller: emailController,
              ),
              SizedBox(height: 10),
              // password textfield
              MyTextformfield(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
              ),
              SizedBox(height: 10),
              // forgot password
              Row(
                mainAxisAlignment: .end,
                children: [
                  Text('Forget password?', style: TextStyle(fontSize: 16)),
                ],
              ),
              // signin button
              MyButton(text: 'Login', ontap: () {}),
              // don't have an account? Register here
            ],
          ),
        ),
      ),
    );
  }
}
