// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:real_auth/UI/loginForm.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColorLight: Colors.blue,
          primaryColorDark: Colors.orange,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: Colors.black87,
              title: const Text('Real Auth',
                  style: const TextStyle(color: Colors.white))),
          body:LoginForm(),
        ));
  }
}
