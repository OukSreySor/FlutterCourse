import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.lightGreenAccent
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ScoreBar(label: 'My score in Flutter'),
            SizedBox(height: 20),
            ScoreBar(label: 'My score in Dart'),
            SizedBox(height: 20),
            ScoreBar(label: 'My score in React'),
          ],
        ),
      )
    )
  ));
}

class ScoreBar extends StatefulWidget {
  const ScoreBar({required this.label, super.key});
  final String label;

  @override
  State<ScoreBar> createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {

  int score = 5;
  final double progressBarWith = 400;
  double get scoreRatio => score / 10.0;

  Color get scoreColor {
    switch (score) {
      case 1:
        return Colors.green[100] as Color;
      case 2:
        return Colors.green[200] as Color;
      case 3:
        return Colors.green[300] as Color;
      case 4:
        return Colors.green[400] as Color;
      case 5:
        return Colors.green[500] as Color;
      case 6:
        return Colors.green[600] as Color;
      case 7:
        return Colors.green[700] as Color;
      case 8:
        return Colors.green[800] as Color;
      case 9:
        return Colors.green[900] as Color;
      default:
        return Colors.green[900] as Color;
    }
  }
  void onMinus() {
    setState(() {
      if (score > 1) {
        score --;
      }
    });
  }
  void onAdd() {
    setState(() {
      if (score < 10) {
        score ++;
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              widget.label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onMinus, 
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: onAdd, 
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            ProgressBar(
              progressBarWith: progressBarWith, 
              scoreColor: scoreColor, 
              scoreRatio: scoreRatio
            ),
            
          ],
        )
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.progressBarWith,
    required this.scoreColor,
    required this.scoreRatio,
  });

  final double progressBarWith;
  final double scoreRatio;
  final Color scoreColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            height: 60,
            width: progressBarWith,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            height: 60,
            width: progressBarWith * scoreRatio,
            decoration: BoxDecoration(
                color: scoreColor, borderRadius: BorderRadius.circular(15)),
          ),
        ],
      )
    );
  }
}











