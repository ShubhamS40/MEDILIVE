import 'package:flutter/material.dart';

class Adminscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              selectedIndex: 6,
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
              child: Center(
                child: Text(
                  'Main Content Area',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
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
