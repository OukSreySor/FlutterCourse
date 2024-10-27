
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({this.text = "hello", required this.start, required this.end});
  final String text;
  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(50),
        gradient: LinearGradient(colors: [start, end]),
      ),
      child: Text(
        "$text",
        textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            decoration: TextDecoration.none
          ),
      ),
    ) ;
  }
}
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(text: "OOP", start: Colors.blue.shade100, end: Colors.green.shade100),
            CustomCard(text: "DART", start: Colors.blue.shade300, end: Colors.green.shade300),
            CustomCard(text: "FLUTTER", start: Colors.blue.shade600, end: Colors.green.shade600),
          ],
        )
      )
    ),
    )
  );
}