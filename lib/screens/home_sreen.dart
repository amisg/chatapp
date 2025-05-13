import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.home),
        title: const Text('Chat App'),
        actions: [
          //search user button
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),

          //more features button
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),

      //floating button to add new user
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            await GoogleSignIn().signOut();
          },
          child: const Icon(Icons.add_box),
        ),
      ),
    );
  }
}
