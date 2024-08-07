import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:try_firestore_web/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('email'),
          TextField(
            controller: emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('password'),
          TextField(
            controller: passwordController,
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage()));
                } catch (e) {
                  inspect(e);
                }
              },
              child: const Text('Submit')),
        ],
      ),
    );
  }
}
