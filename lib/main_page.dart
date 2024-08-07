import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:try_firestore_web/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final db = FirebaseFirestore.instanceFor(app: app);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder(
        future: getDataFirestore(),
        builder: (context,snapshot) {
          return Center(child: Text("Main Route"),);
        }
      ),
    );
  }

  Future getDataFirestore()async{    
    try{
      final res = await db.collection('colors').get();
      inspect(res);
    }
    catch(e){
      inspect(e);
    }
  }
}
