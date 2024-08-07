import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:try_firestore_web/firebase_options.dart';
import 'package:try_firestore_web/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late FirebaseApp app;
late FirebaseFirestore db;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  db = FirebaseFirestore.instanceFor(app: app);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage()
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
