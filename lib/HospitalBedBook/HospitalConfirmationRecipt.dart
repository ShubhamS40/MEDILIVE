import 'package:flutter/material.dart';

class HospitalConfirmationReceipt extends StatelessWidget {
  final String patientName;
  final String department;
  final String disease;
  final String phone;
  final String email;
  final String bedNo;
  final String bookingDate;
  final String address;
  final String registrationNo;

  HospitalConfirmationReceipt({
    required this.registrationNo,
    required this.patientName,
    required this.department,
    required this.disease,
    required this.phone,
    required this.email,
    required this.bedNo,
    required this.bookingDate,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Set a light background color
      appBar: AppBar(
        title: Text('Booking Confirmation'),
        backgroundColor: Colors.blue[800], // Darker blue color
        elevation: 0, // Flat app bar for a cleaner look
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              SizedBox(height: 20),
              _buildDetailSection(),
              SizedBox(height: 30),
              _buildConfirmButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // Header Section
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 60,
            color: Colors.green[400],
          ),
          SizedBox(height: 10),
          Text(
            'Confirmation Successful',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your booking is confirmed. Details are below:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  // Patient Details Section
  Widget _buildDetailSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow("Registration No", registrationNo, Icons.supervised_user_circle),
          _buildDivider(),
          _buildDetailRow('Patient Name', patientName, Icons.person),
          _buildDivider(),
          _buildDetailRow('Department', department, Icons.local_hospital),
          _buildDivider(),
          _buildDetailRow('Disease', disease, Icons.sick),
          _buildDivider(),
          _buildDetailRow('Phone', phone, Icons.phone),
          _buildDivider(),
          _buildDetailRow('Email', email, Icons.email),
          _buildDivider(),
          _buildDetailRow('Bed No.', bedNo, Icons.bed),
          _buildDivider(),
          _buildDetailRow('Booking Date', bookingDate, Icons.calendar_today),
          _buildDivider(),
          _buildDetailRow('Address', address, Icons.location_on),
        ],
      ),
    );
  }

  // Each detail row with icon and data
  Widget _buildDetailRow(String title, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue[800]),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Divider to separate sections
  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[300],
      thickness: 1,
      height: 30,
    );
  }

  // Confirmation button at the bottom
  Widget _buildConfirmButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context); // Return to the previous screen
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text(
        'Go Back to Home',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
