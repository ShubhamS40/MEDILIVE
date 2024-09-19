import 'package:flutter/material.dart';
import 'package:untitled1/screen/homeScreen.dart';
import 'package:untitled1/screen/welcomeScreen.dart';

class Authscreen extends StatefulWidget {
  const Authscreen({super.key});

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  bool isUserLogin = true; // To track whether the user selected "User" or "Admin"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xFF003366), Colors.white], // Dark Blue to Light Blue Gradient
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 600,
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 5, color: Colors.white),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Health Care',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 40),

                        // User Login and Admin Login Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            _buildLoginOptionButton('Hospital Login', false),
                          ],
                        ),
                        const SizedBox(height: 30),

                        // Conditionally showing User or Admin Login Form
                        if (isUserLogin)
                          _buildLoginForm('User Name') // User Login Form
                        else
                          _buildLoginForm('Admin ID'), // Admin Login Form

                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Homescreen()), // Go to HomeScreen on login
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(),
                          child: Image.asset('assets/authlogo.png', width: 500)), // Add your image asset
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build Login Option Button
  Widget _buildLoginOptionButton(String title, bool isUser) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isUserLogin = isUser; // Set the form to either User or Admin based on selection
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isUserLogin == isUser ? Colors.blue[800] : Colors.grey, // Highlight the selected button
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  // Build Login Form (Reused for both User and Admin Login)
  Widget _buildLoginForm(String hintText) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white.withOpacity(0.8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            filled: true,
            fillColor: Colors.white.withOpacity(0.8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
