import 'package:flutter/material.dart';
class HobbyCard extends StatelessWidget {
  const HobbyCard({required this.title, required this.icon, this.colors,super.key});
  final String title;
  final IconData icon;
  final Color? colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: colors??Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                "$title",
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ],
          
        ), 
      ),
    );
  }

}

void main() {
  runApp( MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: const Text(
            'My Hobbies',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              HobbyCard(title: 'Travelling', icon: Icons.travel_explore, colors: Colors.green[600]),
              HobbyCard(title: 'Skating', icon: Icons.skateboarding, colors: Colors.blueGrey),
              HobbyCard(title: 'Running', icon: Icons.directions_run, colors: Colors.blue[700]),
            ],
          ),
        ),
      )
  )
  );
}



