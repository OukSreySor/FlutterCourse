import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: Text(''),
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

  int containerScore = 0;
  int maxScore = 50;

  final double containerWidth = 300;
  final double incrementWidth = 60;
  void increment() {
    setState(() {
      if (containerScore > maxScore) {
        containerScore = 50;
      } else {
        containerScore += 10;
      }
    });
  }
  void decrement() {
    setState(() {
      
      if (containerScore < maxScore) {
        containerScore = 0;
      } else {
        containerScore -= 10;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    double currentWidth = (containerScore / maxScore) * containerWidth;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              '${widget.label}',
              style: TextStyle(
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
                  onPressed: decrement, 
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: increment, 
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.grey.shade800),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: currentWidth,
                      height: 50,
                      

                    )
                  ],
                )
                
              )
            ),
          ],
        )
      ),
    );
  }
}












// class ScoreBar extends StatelessWidget {
//   const ScoreBar({required this.label, super.key});
//   final String label;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15), // Rounded corners
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//              Text(
//               '$label',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: () => {}, 
//                   icon: Icon(Icons.remove),
//                 ),
//                 IconButton(
//                   onPressed: () => {}, 
//                   icon: Icon(Icons.add),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Container(
//                 width: 300,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 0.5, color: Colors.grey.shade800),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               )
//             ),
//           ],
//         )
//       ),
//     );
//   }
// }