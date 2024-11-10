import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s3-statefull_widget/bird.jpg",
  "assets/w4-s3-statefull_widget/bird2.jpg",
  "assets/w4-s3-statefull_widget/insect.jpg",
  "assets/w4-s3-statefull_widget/girl.jpg",
  "assets/w4-s3-statefull_widget/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: ImageState(),
    ));

class ImageState extends StatefulWidget {
  const ImageState({super.key});

  @override
  State<ImageState> createState() => _ImageStateState();
}

class _ImageStateState extends State<ImageState> {
  
  int currentImg = 0;
  void goToPrevious() {
    setState(() {
      if (currentImg == 0) {
        currentImg = images.length -1;
      } else {
        currentImg -= 1;
      }
      
    });
  }
  void goToNext() {
    setState(() {
      if (currentImg == images.length -1) {
        currentImg = 0;
      } else {
        currentImg += 1;
      }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Image viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Go to the previous image',
              onPressed: goToPrevious,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Go to the next image',
                onPressed: goToNext,
              ),
            ),
          ],
        ),
        body: Image.asset(images[currentImg]),
      );
  }
}