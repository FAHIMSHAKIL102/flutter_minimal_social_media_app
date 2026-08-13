import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minimal_social_media_app/database/firestore.dart';
import 'package:flutter_minimal_social_media_app/widget/my_drawer.dart';
import 'package:flutter_minimal_social_media_app/widget/my_post_button.dart';
import 'package:flutter_minimal_social_media_app/widget/my_textformfield.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // firestore access
  final FirestoreDatabase database = FirestoreDatabase();
  // text controller
  final TextEditingController postController = TextEditingController();
  // post message
  void postMessage() {
    // only post message if there is something in the textfield
    if (postController.text.isNotEmpty) {
      String message = postController.text;
      database.addPost(message);
    }
    // clear the controller
    postController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('W A L L'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          // textfield box for user to type
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  child: MyTextformfield(
                    hintText: 'Say something',
                    obscureText: false,
                    controller: postController,
                  ),
                ),
                // post button
                MyPostButton(ontap: postMessage),
              ],
            ),
          ),
          // Post
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              // show loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              // get all
              final posts = snapshot.data!.docs;
              // no data
              if (snapshot.data == null || posts.isEmpty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text('No post.. Post something!'),
                  ),
                );
              }
              // return as a list
              return Expanded(
                child: ListView.builder(itemCount: posts.length,
                  itemBuilder: (context, index) {
                    // get each individual post
                    final post = posts[index];
                    // get data from each post
                    String message = post['PostMessage'];
                    String userEmail = post['UserEmail'];
                    Timestamp timestamp = post['TimeStamp'];
                    // return as a list tile
                    return Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                      child: ListTile(
                        title: Text(message),
                        subtitle: Text(userEmail),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
