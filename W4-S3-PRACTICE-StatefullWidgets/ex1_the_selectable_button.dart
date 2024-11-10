import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Statefull widget-Button"),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectedButton(),
            SizedBox(height: 10),
            SelectedButton(),
            SizedBox(height: 10),
            SelectedButton(),
            SizedBox(height: 10),
            SelectedButton(),
          ]
        )
      ),
));

class SelectedButton extends StatefulWidget {
  const SelectedButton({super.key});
  
  @override
  State<SelectedButton> createState() => _SelectedButtonState();
}

class _SelectedButtonState extends State<SelectedButton> {

  bool isSelected = false;

  void selectedButton() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  String get textLabel => isSelected ? "Not Selected" : "Selected";
  Color get textColor => isSelected ? Colors.black : Colors.white;
  Color get backgroundColor => isSelected ? Colors.blue.shade50 : Colors.blue.shade500;

  @override
  Widget build(BuildContext context) {
    return Center(
          child: SizedBox(
                width: 400,
                height: 100,
                child: ElevatedButton(
                    onPressed: selectedButton,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundColor,
                      foregroundColor: textColor,
                    ),
                    child: Center(
                      child: Text(
                        textLabel,
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    )),
              ),
        );
  }
}