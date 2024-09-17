
import 'package:flutter/cupertino.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [Color(0xFF003366), Color(0xFF66B2FF)],
        ),
      ),
      child: child, // This will be the content of the page
    );
  }
}