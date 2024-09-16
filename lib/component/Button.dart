import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;

  const Button({super.key, required this.text});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Color _buttonColor = Colors.blue[900]!; // Dark Blue color for the button
  Color _hoverColor = Colors.blue[800]!; // Slightly lighter dark blue for hover effect

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _updateColor(_hoverColor),
      onExit: (_) => _updateColor(Colors.blue[900]!),
      child: GestureDetector(
        onTap: () {
          // Define the action on button tap here if needed
        },
        child: Container(
          padding: EdgeInsets.all(16.0), // Equal padding on all sides
          decoration: BoxDecoration(
            color: _buttonColor,
            borderRadius: BorderRadius.circular(12), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(4, 4),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18, // Adjusted font size for better readability
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateColor(Color color) {
    setState(() {
      _buttonColor = color;
    });
  }
}
