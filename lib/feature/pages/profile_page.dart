import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minimal_social_media_app/widget/my_back_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;
  // future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // error
          else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          // data receive
          else if (snapshot.hasData) {
            // extract data
            Map<String, dynamic>? user = snapshot.data!.data();

            return Center(
              child: Column(
                children: [ 
                  // back button
                  Padding(
                    padding: const EdgeInsets.only(top: 50,left: 25),
                    child: Row(mainAxisAlignment: .start,
                      children: [
                        MyBackButton(),
                      ],
                    ),
                  ),
                  // profile pic
                  Container(padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20)
                  ),child: Icon(Icons.person,size: 50,),
                  ),
                  SizedBox(height: 25,),
                  // username
                  Text(user!['username'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  // email
                  Text(user['email']),],
              ),
            );
          } else {
            return Text('No data');
          }
        },
      ),
    );
  }
}
