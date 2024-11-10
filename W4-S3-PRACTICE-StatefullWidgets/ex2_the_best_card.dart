import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Favorite cards"),
        backgroundColor: Colors.blue,
      ),
      body: const Column(
        children: [
          FavoriteCard(),
          FavoriteCard(),
          FavoriteCard(), 
        ],
      ),
    ),
  ));
}
class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});
  
  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  void isSelected() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  Color get iconColor => isFavorite ? Colors.grey : Colors.red;

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.grey)
              ),
            ),
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'title', 
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("description"),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: isSelected, 
                  icon: Icon(
                    isFavorite? Icons.favorite_border : Icons.favorite, 
                    color: iconColor,
                  ),
                  
                ),
              ],
            )
    );
  }
}