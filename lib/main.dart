import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:safety_power_point/pages/computer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      title: 'Safety Power Point',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ComputerPage(),
    );
  }
}
