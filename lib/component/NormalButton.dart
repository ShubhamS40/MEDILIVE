import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  // Constructor to pass text and the action to be performed on tap
  NormalButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Define the action on tap
      child: Material(
        elevation: 10,

        child: Container(
          width: 100,
          height: 40,
         // Button padding
          decoration: BoxDecoration(
            color: Colors.blue[900],// Button background color
            borderRadius: BorderRadius.circular(4),// Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.5), // Shadow color
                offset: Offset(0, 4), // Position of shadow
                blurRadius: 10, // Blurring effect
              ),
            ],
          ),
          child: Center(
            child: Text(
              text, // Button text
              style: TextStyle(

                color: Colors.white, // Text color
                fontSize: 10, // Text size
                fontWeight: FontWeight.bold, // Text weight
              ),
            ),
          ),
        ),
      ),
    );
  }
}
