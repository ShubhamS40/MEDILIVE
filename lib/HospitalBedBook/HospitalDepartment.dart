import 'package:flutter/material.dart';
import 'package:untitled1/HospitalBedBook/HospitalBedSloats.dart';
import 'package:untitled1/component/HomeButton.dart';
import 'package:untitled1/component/GradientColor.dart';
import 'package:untitled1/component/NormalButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DepartmentSelection extends StatelessWidget {
  final List<String> departments = [
    "Anaesthesiology",
    "Anatomy",
    "ANC",
    "Arthroscopy and Joint Disorder",
    "Biochemistry",
    "Biomedical Engineering",
    "Biophysics",
    "Biostatistics",
    "Cardiology"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Department Selection"),
        backgroundColor: Colors.blue[800],
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
                    _buildStep(Icons.add, "Select State/Hospital"),
                    _buildStep(Icons.check_circle_outline, "Select Mode of Appointment"),
                    _buildStep(Icons.check_circle_outline, "Select Appointment Type"),
                    _buildStep(Icons.add, "Select Department"),
                    _buildStep(Icons.calendar_today, "Select Date of Appointment"),
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
                              width: 1,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Department",
                              style: TextStyle(
                                fontSize: 24, // Increases the font size
                                fontWeight: FontWeight.bold, // Makes the text bold
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Type Department Name",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue, // Text color blue
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Search Department",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue, // Text color blue
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: _buildDepartmentList(), // List of departments
                      ),
                      SizedBox(height: 16),
                      // Buttons after the department list
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NormalButton(
                            text: "Previous",
                            onPressed: () {
                              // Define what happens when Previous is clicked
                            },
                          ),
                          NormalButton(
                            text: "Start Again",
                            onPressed: () {
                              // Define what happens when Start Again is clicked
                            },
                          ),
                        ],
                      ),
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
            style: TextStyle(fontSize: 16, color: Colors.white), // Text color on gradient
          ),
        ],
      ),
    );
  }

  // Updated department list with capsule icon
  Widget _buildDepartmentList() {
    return ListView.builder(
      itemCount: departments.length,
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
                  leading: Icon(
                    FontAwesomeIcons.capsules, // Capsule icon next to department name
                    color: Colors.white,
                  ),
                  title: Text(
                    departments[index],
                    style: TextStyle(color: Colors.white), // White text color
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AvailableSlotsPage(),
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
