import 'package:flutter/material.dart';
import 'package:flutter_workspace/W6-S1%20-%20PRACTICE-Lists_PassFunctions_LiftStatesUp/EX3-SwitchingFromScreen/screen/welcome.dart';
import 'package:flutter_workspace/W6-S1%20-%20PRACTICE-Lists_PassFunctions_LiftStatesUp/EX3-SwitchingFromScreen/screen/temperature.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});
    
  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool currentScreen = true;

  void isClicked() {
    setState(() {
      currentScreen = !currentScreen;
    });
  }
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen ? Welcome(switchScreen: isClicked): Temperature(converterScreen: isClicked) 
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
