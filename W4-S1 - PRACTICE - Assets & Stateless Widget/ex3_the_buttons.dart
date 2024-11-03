import 'package:flutter/material.dart';

enum ButtonType {
  Primary, Secondary, Disabled;
}

class CustomButton extends StatelessWidget {
  const CustomButton({required this.label, required this.icon, this.iconPosition = 'left', this.buttonType = ButtonType.Primary, super.key});

  final String label;
  final IconData icon;
  final String iconPosition;
  final ButtonType buttonType;
  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    if (buttonType == ButtonType.Primary) {
      buttonColor = Colors.blue;
    }
    else if (buttonType == ButtonType.Secondary) {
      buttonColor = Colors.green;
    }
    else {
      buttonColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        
        color: buttonColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPosition == 'left') ...[
              Icon(
                icon, 
                color: Colors.grey[600],
                size: 25,
              ),
              const SizedBox(width: 10),
              Text(
                "$label",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 20,
                ),
              ),
            ] else if (iconPosition == 'right') ...[
              Text(
                "$label",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 20,
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                icon, 
                color: Colors.grey[600],
                size: 25,
              ),
            ] else ...[
              Icon(
                icon, 
                color: Colors.grey[600],
                size: 25,
              ),
              const SizedBox(width: 10),
              Text(
                "$label",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 20,
                ),
              ),
            ]  
        ],
        ),
      ),
    );
  }
}
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      //backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text('Custom buttons',),
      ),
      body: const Column(
        children: [
          CustomButton(label: "Submit", icon: Icons.check, buttonType: ButtonType.Primary, iconPosition: 'right'),
          CustomButton(label: "Time", icon: Icons.access_time, buttonType: ButtonType.Secondary),
          CustomButton(label: "Account", icon: Icons.account_tree, buttonType: ButtonType.Disabled, iconPosition:  'right'),
        ],
      ),
    ),
  ));
}