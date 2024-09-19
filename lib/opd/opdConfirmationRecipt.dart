import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Opdconfirmationrecipt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final String opdRegNo = "1007131051"; // Example OPD Registration Number
    final String bookingDate = DateFormat('dd MMM yyyy hh:mm a').format(DateTime.now());
    final String patientName = "DCD (PID-10978175)";
    final String sex = "M";
    final String age = "19Y 4M 2D";
    final String opdDate = "09 Sep 2024 9am To 12noon";
    final String mobileNo = "1234567890";

    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background color
      appBar: AppBar(
        title: Text(
          'OPD Registration Receipt',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800], // Dark blue app bar
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              width: screenWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleSection(opdRegNo, bookingDate),
                  SizedBox(height: 20),
                  _buildPatientDetails(patientName, sex, age, opdDate, mobileNo),
                  SizedBox(height: 20),
                  _buildInvestigationsSection(),
                  SizedBox(height: 20),
                  _buildClinicalsSection(),
                  SizedBox(height: 20),
                  _buildTrackYourTokenSection(),
                  SizedBox(height: 20),
                  _buildBackButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection(String opdRegNo, String bookingDate) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "DH JPC HOSPITAL",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Online OPD Registration Card",
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "OPD Reg. No.: $opdRegNo",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                "Booking Date: $bookingDate",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPatientDetails(String patientName, String sex, String age, String opdDate, String mobileNo) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow('Patient Name', patientName, Icons.person),
          _buildDivider(),
          _buildDetailRow('Sex', sex, Icons.male),
          _buildDivider(),
          _buildDetailRow('Age', age, Icons.cake),
          _buildDivider(),
          _buildDetailRow('OPD Date', opdDate, Icons.calendar_today),
          _buildDivider(),
          _buildDetailRow('Mobile No.', mobileNo, Icons.phone),
        ],
      ),
    );
  }

  Widget _buildInvestigationsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Investigations",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.blue[800],
            ),
          ),
          SizedBox(height: 10),
          _buildSimpleInvestigationRow('HB/TLC/DLC'),
          _buildSimpleInvestigationRow('PS'),
          _buildSimpleInvestigationRow('Sugar'),
          _buildSimpleInvestigationRow('Urea'),
        ],
      ),
    );
  }

  Widget _buildSimpleInvestigationRow(String testName) {
    return Row(
      children: [
        Icon(Icons.science, color: Colors.blue[800]),
        SizedBox(width: 10),
        Text(
          testName,
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildClinicalsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Clinical Findings & Reports",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.blue[800],
            ),
          ),
          SizedBox(height: 10),
          _buildDetailRow('Complaints/Problems', 'Sore throat and hearing issues', Icons.report),
        ],
      ),
    );
  }

  Widget _buildTrackYourTokenSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Track Your Token No.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.blue[800],
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.black12,
              child: Text(
                "Token No: 42223210078",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context); // Go back to the previous screen
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[800],
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        "Go Back",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue[800]),
        SizedBox(width: 10),
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

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[300],
      thickness: 1,
      height: 20,
    );
  }
}
