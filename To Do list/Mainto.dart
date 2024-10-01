import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_dolist/Provider/true_provider.dart';
import 'package:to_dolist/To%20Do%20list/Todolist.dart';
import 'package:provider/provider.dart';

import '../Provider/Provid.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent));
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(
              create: (_)=>ProvideScreen()),
          ChangeNotifierProvider(
              create: (_)=>IsTrue()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white12),
        ),
        home:Home(),
      )
    );
  }
}