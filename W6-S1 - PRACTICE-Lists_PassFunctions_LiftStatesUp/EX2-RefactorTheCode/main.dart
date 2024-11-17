import 'package:flutter/material.dart';
import 'package:flutter_workspace/W6-S1%20-%20PRACTICE-Lists_PassFunctions_LiftStatesUp/EX2-RefactorTheCode/data/profile_data.dart';
import 'package:flutter_workspace/W6-S1%20-%20PRACTICE-Lists_PassFunctions_LiftStatesUp/EX2-RefactorTheCode/model/profile_tile_model.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(profile: sreysorProfile),
  ));
}

const Color mainColor = Color(0xff5E9FCD);

class ProfileApp extends StatelessWidget {
  const ProfileApp({
    super.key,
    required this.profile,
  });

  final ProfileData profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withAlpha(100),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [ 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      profile.avatarUrl), 
                ),
                const SizedBox(height: 20),
                Text(
                  profile.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                ),
                Text(
                  profile.position,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                ...profile.tiles.map((tile) =>
                  ProfileTile(icon: tile.icon, title: tile.title, data: tile.value),
                )
              ],
            )
          ]
          ),
       ),
      
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: mainColor),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}