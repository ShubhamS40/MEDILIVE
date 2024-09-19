import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // For image slider
import 'package:untitled1/HospitalBedBook/HospitalBedbooking.dart';
import 'package:untitled1/component/HomeButton.dart';
import 'package:untitled1/component/Navbar.dart';
import 'package:untitled1/opd/opdRegistration.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [Color(0xFF003366), Color(0xFF66B2FF)], // Dark Blue to Light Blue Gradient
          ),
        ),
        child: Column(
          children: [
            Navbar(),
            SizedBox(height: 20),
            AdvertisementSlider(), // The Advertisement Slider added here
            Expanded(
              child: MainCard(),
            ),
          ],
        ),
      ),
    );
  }
}

class AdvertisementSlider extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/ad1.png', // Your advertisement images
    'assets/ad2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 180,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
          autoPlayInterval: Duration(seconds: 3),
        ),
        items: imageUrls.map((url) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(url, fit: BoxFit.cover),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  final List<String> method = [
    "OPD", "Beds", "Patient Detail", "Birth Record", "Waste Disposal",
    "Emergency", "Blood Bank", "Medicine",
    "Equipment", "Chat"
  ];

  final List<Widget?> screens = [
    OPDRegistrationScreen(),
    BedBookingPage(),
    null, // Placeholder for missing screens
    null, // Add more placeholders
    null,
    null,
    null,
    null,
    null,
    null
  ];

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: method.sublist(0, 5).asMap().entries.map((entry) {
                        int index = entry.key;
                        String text = entry.value;
                        return Button(
                          text: text,
                          navigateTo: () {
                            if (screens[index] != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => screens[index]!),
                              );
                            }
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: method.sublist(5).asMap().entries.map((entry) {
                        int index = entry.key + 5; // Adjust index for the second column
                        String text = entry.value;
                        return Button(
                          text: text,
                          navigateTo: () {
                            if (screens[index] != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => screens[index]!),
                              );
                            }
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                color: Colors.red,
                height: 350,
                width: 600,
                child: Image.asset(
                  "assets/inventory.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 150,
                left: 150,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Where healthcare meets precision",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
