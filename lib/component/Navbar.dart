import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  Color _iconColor = Colors.white; // Default icon color

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[900], // Dark Blue color for the navbar
      leading: MouseRegion(
        onEnter: (_) => _updateIconColor(Colors.blue[700]!),
        onExit: (_) => _updateIconColor(Colors.white),
        child: IconButton(
          icon: Icon(Icons.menu),
          color: _iconColor,
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: Text(
        'Your App Title',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white, // White text color
          fontFamily: 'Roboto', // Change to your custom font if available
        ),
      ),
      actions: [
        MouseRegion(
          onEnter: (_) => _updateIconColor(Colors.blue[700]!),
          onExit: (_) => _updateIconColor(Colors.white),
          child: IconButton(
            icon: Icon(Icons.search),
            color: _iconColor,
            onPressed: () {
              // Define the action for the search button here
            },
          ),
        ),
        MouseRegion(
          onEnter: (_) => _updateIconColor(Colors.blue[700]!),
          onExit: (_) => _updateIconColor(Colors.white),
          child: IconButton(
            icon: Icon(Icons.notifications),
            color: _iconColor,
            onPressed: () {
              // Define the action for the notifications button here
            },
          ),
        ),
      ],
      elevation: 8, // Adds shadow for a more pronounced 3D effect
      toolbarHeight: 70, // Increased height for a more spacious look
    );
  }

  void _updateIconColor(Color color) {
    setState(() {
      _iconColor = color;
    });
  }
}
