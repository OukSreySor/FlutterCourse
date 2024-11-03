import 'package:flutter/material.dart';

enum Product{
  Dart, Flutter, Firebase;
}

class ProductCard extends StatelessWidget {
  ProductCard({required this.title, required this.description, required this.image});

  final Product title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
     return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        '$image',
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        title.name,
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      Text("$description"),
                    ],
                  ),
                ),
            ),
        ],
  );
  }
}

void main() {
  runApp( MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.pink[50],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
        children: [
          ProductCard(title: Product.Dart ,description: 'the best object language', image: 'assets/w4-s1-stateless_widget/dart.png'),
          ProductCard(title: Product.Flutter ,description: 'the best mobile widget library', image: 'assets/w4-s1-stateless_widget/flutter.png'),
          ProductCard(title: Product.Firebase ,description: 'the best cloud database', image: 'assets/w4-s1-stateless_widget/firebase.png'),
        ],
      )
      
    ),
    ),
  ));
        
}