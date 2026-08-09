import 'package:flutter/material.dart';
import 'package:flutter_minimal_social_media_app/widget/my_button.dart';
import 'package:flutter_minimal_social_media_app/widget/my_textformfield.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginPage({super.key, this.onTap});
  void login() {}
  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 25),
              // signin button
              MyButton(text: 'Login', ontap: login),
              SizedBox(height: 25),
              // don't have an account? Register here
              Row(
                mainAxisAlignment: .end,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      " Register Here",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
