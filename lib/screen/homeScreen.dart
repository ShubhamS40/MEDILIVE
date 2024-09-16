import 'package:flutter/material.dart';
import 'package:untitled1/component/Button.dart';
import 'package:untitled1/component/Navbar.dart';

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
           Container(

             child: Column(
               children: [
                 Navbar(),
                 MainCard()
               ],
             ),
           )
         ],
       ),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                      children: method.sublist(0, 5).map((text) => Button(text: text)).toList(),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: method.sublist(5).map((text) => Button(text: text)).toList(),
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





