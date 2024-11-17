import 'package:flutter/material.dart';
import 'package:flutter_workspace/W6-S1%20-%20PRACTICE-Lists_PassFunctions_LiftStatesUp/EX2-RefactorTheCode/model/profile_tile_model.dart';


ProfileData sreysorProfile = ProfileData(
    name: "sreysor OUK",
    position: "Flutter Developer",
    avatarUrl: 'assets/w5-s2/avatar.jpg',
    tiles: [
      TileData( icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "sreysor.ouk@student.cadt.edu.kh"),
      
    ]
);