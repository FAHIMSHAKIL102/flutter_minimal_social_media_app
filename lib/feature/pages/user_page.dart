import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minimal_social_media_app/helper/helper_functions.dart';
import 'package:flutter_minimal_social_media_app/widget/my_back_button.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          // any error
          if (snapshot.hasError) {
            displayMessageToUser('Something went wrong', context);
          }
          // show loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null) {
            return Text('No Data');
          }
          // get all users
          final users = snapshot.data!.docs;
          return Column(
            children: [
              // back button
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 25),
                child: Row(
                  mainAxisAlignment: .start,
                  children: [MyBackButton()],
                ),
              ),
              Expanded(
                child: ListView.builder(padding: EdgeInsets.all(25),
                  itemBuilder: (context, index) {
                    // get individual user
                    final user = users[index];
                    return ListTile(
                      title: Text(user['username']),
                      subtitle: Text(user['email']),
                    );
                  },
                  itemCount: users.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
