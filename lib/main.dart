import 'package:flutter/material.dart';
import 'package:untitled1/opd/opdRecipt.dart';
import 'package:untitled1/opd/previewRegistration.dart';
import 'package:untitled1/screen/adminScreen.dart';
import 'package:untitled1/screen/authScreen.dart';
import 'package:untitled1/screen/homeScreen.dart';
import 'package:untitled1/screen/welcomeScreen.dart';
import 'package:untitled1/opd/opdRegistration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Homescreen()
    );
  }
}
