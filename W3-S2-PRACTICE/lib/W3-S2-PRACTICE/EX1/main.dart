import 'package:flutter/material.dart';

// Exercise 1
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Text("Hello my name is Sreysor!", style: TextStyle(color: Colors.orange, fontSize: 50),

          ),
        ),
      ) ,
    );
  }
}