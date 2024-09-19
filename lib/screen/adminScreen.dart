import 'package:flutter/material.dart';
import 'dart:math';

class Adminscreen extends StatelessWidget {
  final List<String> patientNames = [
    'John Doe',
    'Jane Smith',
    'Robert Johnson',
    'Emily Davis',
    'Michael Brown',
    'Jessica Garcia',
    'David Miller',
    'Sarah Wilson',
    'James Martinez',
    'Linda Lee'
  ];

  final List<String> departments = [
    'Cardiology',
    'Neurology',
    'Orthopedics',
    'Pediatrics',
    'Gynecology',
    'Dermatology',
    'Radiology',
    'Oncology',
    'Emergency',
    'Urology'
  ];

  final List<String> diseases = [
    'Hypertension',
    'Diabetes',
    'Asthma',
    'Cancer',
    'Heart Disease',
    'Migraine',
    'Arthritis',
    'Flu',
    'Kidney Failure',
    'Allergy'
  ];

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> patientData = List.generate(10, (index) {
      return {
        'name': patientNames[random.nextInt(patientNames.length)],
        'token': random.nextInt(100) + 1,
        'age': random.nextInt(100),
        'contact': '999999999${random.nextInt(9)}',
        'department': departments[random.nextInt(departments.length)],
        'disease': diseases[random.nextInt(diseases.length)],
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('MediLive Admin', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.language, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Delhi India',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: Row(
        children: [
          SizedBox(
            width: 220,
            child: NavigationRail(
              backgroundColor: Colors.blue[900],
              selectedIndex: 0, // Highlight OPDs section
              useIndicator: false,
              onDestinationSelected: (int index) {},
              labelType: NavigationRailLabelType.all,
              destinations: [
                customRailDestination(Icons.local_hospital, 'OPDs'),
                customRailDestination(Icons.hotel, 'Beds'),
                customRailDestination(Icons.person, 'Patient Details'),
                customRailDestination(Icons.assignment, 'Birth & Death Records'),
                customRailDestination(Icons.delete, 'Waste Disposal'),
                customRailDestination(Icons.emergency, 'Emergency Medicine'),
                customRailDestination(Icons.bloodtype_sharp, 'Blood Bank'),
              ],
            ),
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'Patient Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontSize: 16,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Token No.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontSize: 16,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Age',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontSize: 16,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Contact No.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontSize: 16,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Department',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontSize: 16,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Disease',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
                rows: patientData.map((patient) {
                  return DataRow(cells: [
                    DataCell(Text(patient['name'])),
                    DataCell(Text(patient['token'].toString())),
                    DataCell(Text(patient['age'].toString())),
                    DataCell(Text(patient['contact'])),
                    DataCell(Text(patient['department'])),
                    DataCell(Text(patient['disease'])),
                  ]);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  NavigationRailDestination customRailDestination(IconData icon, String label) {
    return NavigationRailDestination(
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      label: Text(''),
    );
  }
}
