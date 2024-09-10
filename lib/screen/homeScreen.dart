import 'package:flutter/material.dart';
import 'package:untitled1/screen/adminScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(

      body: Container(
        constraints: BoxConstraints.expand(), // Ensure the container takes up the whole screen
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [Color(0xFF003366), Color(0xFF66B2FF)], // Dark Blue to Light Blue Gradient
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.1), // Dynamic top margin
                      Row(
                        children: [
                          // Left side: Welcome content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome to Medilive!",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Text(
                                  "Medilive simplifies your healthcare experience with convenient features for booking OPD appointments and checking live bed availability. Easily schedule appointments with top doctors and receive instant notifications. Stay informed with real-time updates on bed availability in nearby hospitals. Download Medilive to manage your health effortlessly!",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white70,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(height: screenHeight * 0.03), // Spacing before the button
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent, // Light Blue Button Color
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Adminscreen()));
                                      },
                                      child: Text(
                                        'Get Started',
                                        style: TextStyle(
                                          color: Colors.white, // Light Text Color
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.05), // Space between content and image
                          // Right side: Image
                          Image.asset(
                            "assets/homelogo.png",
                            width: screenWidth * 0.4, // Adjust the width as needed
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.05), // Spacing before services section
                      // Add the service section here
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}

class Servicesection extends StatefulWidget {
  const Servicesection({super.key});

  @override
  State<Servicesection> createState() => _ServicesectionState();
}

class _ServicesectionState extends State<Servicesection> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    bool isDesktop = screenWidth > 1024;
    bool isTablet = screenWidth > 768 && screenWidth <= 1024;
    bool isMobile = screenWidth <= 768;

    double imageWidth = isDesktop ? 200 : (isTablet ? 150 : 80);
    double imageHeight = isDesktop ? 250 : (isTablet ? 180 : 100);

    double fontSizeTitle = isDesktop ? 24 : (isTablet ? 20 : 18);
    double fontSizeSubtitle = isDesktop ? 16 : (isTablet ? 14 : 12);
    double paddingHorizontal = isDesktop ? 40 : (isTablet ? 30 : 20);
    double buttonPadding = isDesktop ? 16 : (isTablet ? 12 : 10);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Patient Registration',
                    style: TextStyle(
                      fontSize: fontSizeTitle,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003366),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Consult with the most trusted and suitable doctor.',
                    style: TextStyle(
                      fontSize: fontSizeSubtitle,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: paddingHorizontal, vertical: buttonPadding),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Adminscreen()));
                        },
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeSubtitle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Container(
              height: imageHeight,
              width: imageWidth,
              child: Image.asset(
                'assets/inventory.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
