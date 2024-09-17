import 'package:flutter/material.dart';


class BedStatusPage extends StatelessWidget {
  final List<Map<String, dynamic>> beds = List.generate(
    20,
        (index) => {
      "bedNumber": index + 1,
      "status": index % 3 == 0 ? "Available" : "Occupied",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospital Bed Availability"),
        backgroundColor: Colors.blue[900], // Dark Blue Color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blue[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Display 3 columns to maximize bed status
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2 / 1, // Adjust for rectangular card shape
            ),
            itemCount: beds.length,
            itemBuilder: (context, index) {
              final bed = beds[index];
              return BedCard(
                bedNumber: bed['bedNumber'],
                status: bed['status'],
              );
            },
          ),
        ),
      ),
    );
  }
}

class BedCard extends StatelessWidget {
  final int bedNumber;
  final String status;

  const BedCard({required this.bedNumber, required this.status});

  @override
  Widget build(BuildContext context) {
    bool isAvailable = status == "Available";

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: isAvailable ? Colors.greenAccent[400] : Colors.redAccent[400],
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Bed $bedNumber",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              status,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BedStatusPage(),
    theme: ThemeData.dark(),
  ));
}