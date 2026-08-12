import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minimal_social_media_app/helper/helper_functions.dart';
import 'package:flutter_minimal_social_media_app/widget/my_button.dart';
import 'package:flutter_minimal_social_media_app/widget/my_textformfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // register metod
  void register() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    //make sure passwords match
    if (passwordController.text != confirmPasswordController.text) {
      // pop loading circle
      Navigator.pop(context);
      // show error message
      displayMessageToUser('Password do not match', context);
    }else{
      // try creating the user
      try {
        // create the user
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // pop loading circle
        Navigator.pop(context);
        // display error message to user
        displayMessageToUser(e.code, context);
      }
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
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
                // user name
                MyTextformfield(
                  hintText: 'User Name',
                  obscureText: false,
                  controller: userNameController,
                ),
                SizedBox(height: 10),
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
                // confirm password textfield
                MyTextformfield(
                  hintText: 'Confirm Password',
                  obscureText: true,
                  controller: confirmPasswordController,
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
                MyButton(text: 'Register', ontap: register),
                SizedBox(height: 25),
                // don't have an account? Register here
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        " Login Here",
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
      ),
    );
  }
}
