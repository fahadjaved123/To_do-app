import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
class ProvideScreen extends ChangeNotifier{
  IconData? ion;
  final ref=FirebaseDatabase.instance.ref('Todo');
  void Add(String title){
    String ID=DateTime.now().microsecondsSinceEpoch.toString();
    ref.child(ID).set({
      'ID':ID,
      'Title':title,
      'IconCodePoint': ion?.codePoint,
      'IconFontFamily': ion?.fontFamily,
    }).then((value){
      print('Add post');
    }).onError((error,StackTrace){
      print(error.toString());
    });
  }
  geticon(IconData? icon){
   ion=icon;
   notifyListeners();
  }
}