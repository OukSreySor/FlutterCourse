import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: Container( 
        padding: const EdgeInsets.all(30), 
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.blue[300]),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue[600], 
          ),
          child: const Center(
            child: Text(
              ("CADT STUDENTS"),
              style: TextStyle(fontSize: 35 , color: Colors.white, decoration: TextDecoration.none ),
            ),
           
          ), 
        ),
      ),
    );
  }
}