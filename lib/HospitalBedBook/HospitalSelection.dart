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
        title: Text("Hospital Bed Booking"),
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
                      "Looking for a bed?",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildStep(Icons.local_hospital, "Select Hospital"),
                    _buildStep(Icons.event_available, "Check Bed Availability"),
                    _buildStep(Icons.medical_services_outlined,
                        "Select Department"),
                    _buildStep(Icons.calendar_today,
                        "Select Date for Booking"),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Hospital",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Type Hospital Name",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Search Hospital",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: _buildHospitalList(),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NormalButton(text: "Previous", onPressed: () {}),
                          NormalButton(text: "Next", onPressed: () {}),
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
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

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
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    hospitals[index],
                    style: TextStyle(color: Colors.white),
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
