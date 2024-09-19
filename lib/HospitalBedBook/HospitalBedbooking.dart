import 'package:flutter/material.dart';
import 'package:untitled1/HospitalBedBook/HospitalBedSloats.dart';
import 'package:untitled1/HospitalBedBook/HospitalSelection.dart';
import 'package:untitled1/component/GradientColor.dart';

class BedBookingPage extends StatelessWidget {
  final List<String> states = [
    "Andaman & Nicobar Islands", "Andhra Pradesh", "Arunachal Pradesh",
    "Assam", "Bihar", "Chhattisgarh", "Delhi", "Gujarat", "Haryana",
    "Jammu and Kashmir", "Himachal Pradesh", "Jharkhand"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bed Booking System"),
        backgroundColor: Colors.blue[800], // Make AppBar transparent to blend with gradient
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
                      "Hospital Bed Booking For Diffrent Department",
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
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                          indicatorColor: Colors.blue[900],
                          labelColor: Colors.blue,
                          tabs: [
                            Tab(text: "STATE"),
                            Tab(text: "AIIMS"),
                            Tab(text: "DEFENCE(AFMES)"),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              _buildStateList(),
                              Center(child: Text("AIIMS List", style: TextStyle(color: Colors.white))),
                              Center(child: Text("Defense Hospitals", style: TextStyle(color: Colors.white))),
                            ],
                          ),
                        ),
                      ],
                    ),
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

  // Updated state list with border radius, elevation effect, and hover interaction
  Widget _buildStateList() {
    return ListView.builder(
      itemCount: states.length,
      itemBuilder: (context, index) {
        bool isHovered = false;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: MouseRegion(
            onEnter: (_) {
              isHovered = true;
            },
            onExit: (_) {
              isHovered = false;
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: isHovered ? Colors.blue[900] : Colors.blue[800], // Hover effect
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: isHovered
                    ? [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2)]
                    : [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)],
              ),
              child: ListTile(
                title: Text(
                  states[index],
                  style: TextStyle(color: Colors.white), // White text color
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Hospitalselection(),));
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
