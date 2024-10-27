
import 'package:flutter/material.dart';
void main() {
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        //child: Center(
        padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Box 1
              Container(
                width: 400,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(50),
                  color: Colors.blue[100],
                ),
                child: const Center(
                  child: Text(
                    "OOP",
                    style: TextStyle(fontSize: 30, color: Colors.white, decoration: TextDecoration.none),
                  ),
                ),
              ),

              //Box 2
              Container(
                width: 400,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(50),
                  color: Colors.blue[300],
                ),
                child: const Center(
                  child: Text(
                    "DART",
                    style: TextStyle(fontSize: 30, color: Colors.white, decoration: TextDecoration.none),
                  ),
                ),
              ),
              //Box 3
              Container(
                width: 400,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(50),
                  gradient: const LinearGradient(
                    colors: <Color>[
                       Color.fromARGB(255, 27, 141, 235), 
                       Color.fromARGB(255, 1, 34, 111),
                      ], 
                  ),
                ),
                child: const Center(
                  child: Text(
                    "FLUTTER",
                    style: TextStyle(fontSize: 30, color: Colors.white, decoration: TextDecoration.none),
                  ),
                ),
              )
            ],
          ),
      )
  );     
  }
}