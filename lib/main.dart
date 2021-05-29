import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent
      ),
      home: Start(),
      debugShowCheckedModeBanner: false,
    );
  }
}
