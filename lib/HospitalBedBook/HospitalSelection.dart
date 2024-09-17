import 'package:flutter/material.dart';
import 'package:untitled1/HospitalBedBook/HospitalBedSloats.dart';
import 'package:untitled1/HospitalBedBook/HospitalDepartment.dart';
import 'package:untitled1/component/HomeButton.dart';
import 'package:untitled1/component/GradientColor.dart';
import 'package:untitled1/component/NormalButton.dart';

class Hospitalselection extends StatelessWidget {
  final List<String> hospitals = [
    "Apollo Hospital",
    "Fortis Hospital",
    "AIIMS",
    "Max Hospital",
    "Medanta Hospital",
    "Sir Ganga Ram Hospital",
    "BLK Super Speciality Hospital",
    "Manipal Hospital",
    "Holy Family Hospital",
    "Moolchand Hospital"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospital Selection"),
        backgroundColor: Colors.blue[800],
        // Make AppBar transparent to blend with gradient
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.dashboard), onPressed: () {}),
          TextButton(
            onPressed: () {},
            child: Text(
              'Register/Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: GradientBackground(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Need an appointment?",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color on gradient
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildStep(Icons.add, "Select Hospital"),
                    _buildStep(Icons.check_circle_outline,
                        "Select Mode of Appointment"),
                    _buildStep(
                        Icons.check_circle_outline, "Select Appointment Type"),
                    _buildStep(Icons.add, "Select Department"),
                    _buildStep(
                        Icons.calendar_today, "Select Date of Appointment"),
                    _buildStep(Icons.person, "Register/Login"),
                    _buildStep(Icons.sms, "Get Confirmation SMS"),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.blue))),
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(16.0),
                        // Adds padding around the content
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // Aligns content to the start
                          children: [
                            Text(
                              "Select Hospital",
                              style: TextStyle(
                                fontSize: 24, // Increases the font size
                                fontWeight: FontWeight
                                    .bold, // Makes the text bold
                              ),
                            ),
                            SizedBox(height: 2),
                            // Adds vertical space between the texts
                            Text(
                              "Type Hospital Name",
                              style: TextStyle(
                                fontSize: 18, // Adjust font size if needed
                                color: Colors.blue, // Makes the text color blue
                              ),
                            ),
                            SizedBox(height: 2),
                            // Adds vertical space between the texts
                            Text(
                              "Search Hospital",
                              style: TextStyle(
                                fontSize: 18, // Adjust font size if needed
                                color: Colors.blue, // Makes the text color blue
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      // Adds spacing between the header and the list
                      Expanded(
                        child: _buildHospitalList(), // Wrap the list in Expanded
                      ),
                      SizedBox(height: 16),

                      // Adds spacing between the list and buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NormalButton(text: "Prvious",onPressed: (){},),
                          NormalButton(text: "Next",onPressed: (){},),
                        ],
                      ),

                      // Buttons after the hospital list
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

  Widget _buildStep(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white), // Icon color on gradient
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
                fontSize: 16, color: Colors.white), // Text color on gradient
          ),
        ],
      ),
    );
  }

  // Updated hospital list with border radius, elevation effect, and hover interaction
  Widget _buildHospitalList() {
    return ListView.builder(
      itemCount: hospitals.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: MouseRegion(
            onEnter: (_) {},
            onExit: (_) {},
            child: Material(
              elevation: 5, // Adds shadow effect
              borderRadius: BorderRadius.circular(10), // Rounded corners
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[800], // Card background color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    hospitals[index],
                    style: TextStyle(color: Colors.white), // White text color
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DepartmentSelection(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
