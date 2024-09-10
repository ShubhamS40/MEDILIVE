import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OPDReceiptScreen extends StatelessWidget {
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
      appBar: AppBar(
        title: Text(
          'OPD Registration Receipt',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey[300]!,
                    blurRadius: 10,
                    spreadRadius: 2,
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
                  _buildBarcodeAndBackButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection(String opdRegNo, String bookingDate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "DH JPC HOSPITAL",
          style: TextStyle(
            fontSize: 18,
            color: Colors.blue[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Online OPD Registration Card",
          style: TextStyle(fontSize: 16, color: Colors.blue[900]),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "OPD Reg. No.: $opdRegNo",
              style: TextStyle(fontSize: 16, color: Colors.blue[900]),
            ),
            Text(
              "Booking Date: $bookingDate",
              style: TextStyle(fontSize: 16, color: Colors.blue[900]),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPatientDetails(String patientName, String sex, String age, String opdDate, String mobileNo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHardcodedField("Patient Name", patientName),
        Row(
          children: [
            Expanded(child: _buildHardcodedField("Sex", sex)),
            SizedBox(width: 20),
            Expanded(child: _buildHardcodedField("Age", age)),
          ],
        ),
        _buildHardcodedField("OPD Date", opdDate),
        _buildHardcodedField("Mobile No.", mobileNo),
      ],
    );
  }

  Widget _buildInvestigationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Investigations",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.blue[900],
          ),
        ),
        SizedBox(height: 10),
        _buildHardcodedField("HB/TLC/DLC", ""),
        _buildHardcodedField("PS", ""),
        _buildHardcodedField("Sugar", ""),
        _buildHardcodedField("Urea", ""),
        // Add more investigation fields as needed
      ],
    );
  }

  Widget _buildClinicalsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Clinical Findings & Reports",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.blue[900],
          ),
        ),
        SizedBox(height: 10),
        _buildHardcodedField("Complaints/Problems", "Sore throat and hearing issues"),
        _buildHardcodedField("ICD Code", ""),
      ],
    );
  }

  Widget _buildBarcodeAndBackButton(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 80,
            width: 300,
            color: Colors.black12,
            child: Center(
              child: Text(
                "Barcode Here",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Back"),
        ),
      ],
    );
  }

  Widget _buildHardcodedField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
