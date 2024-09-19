import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:untitled1/opd/opdConfirmationRecipt.dart';
import 'opdConfirmationRecipt.dart'; // Make sure this file exists in your project for OPDReceiptScreen

class OPDPreviewScreen extends StatefulWidget {
  @override
  _OPDPreviewScreenState createState() => _OPDPreviewScreenState();
}

class _OPDPreviewScreenState extends State<OPDPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OPD Registration Preview', // Updated title
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              width: screenWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleSection(),
                  SizedBox(height: 20),
                  OPDForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hospital Name: DH JPC Hospital",
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Department Name: ENT (Mon, Wed, Fri, Sat)",
          style: TextStyle(fontSize: 18, color: Colors.blue[800]),
        ),
        SizedBox(height: 8),
        Text(
          "Date: ${DateFormat('dd-MM-yyyy').format(DateTime.now())}",
          style: TextStyle(fontSize: 18, color: Colors.blue[800]),
        ),
      ],
    );
  }
}

class OPDForm extends StatelessWidget {
  // Hardcoded patient details
  final String patientName = "John Doe";
  final String age = "30";
  final String sex = "Male";
  final String fatherName = "Michael Doe";
  final String address = "123 Main St, City, Country";
  final String complaints = "Sore Throat and Hearing Issues";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHardcodedField("Patient Name", patientName),
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(child: _buildHardcodedField("Age", age)),
            SizedBox(width: 20),
            Expanded(child: _buildHardcodedField("Sex", sex)),
          ],
        ),
        SizedBox(height: 15),
        _buildHardcodedField("S/o", fatherName),
        SizedBox(height: 15),
        _buildHardcodedField("Address", address),
        SizedBox(height: 15),
        _buildHardcodedField("Complaints", complaints),
        SizedBox(height: 20),
        _buildCheckboxField(),
        SizedBox(height: 15),

        SizedBox(height: 25),
        _buildSubmitButtons(context),
      ],
    );
  }

  Widget _buildHardcodedField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxField() {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (bool? value) {},
          activeColor: Colors.blue[800],
        ),
        Expanded(
          child: Text(
            "All the above information is correct.",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }



  Widget _buildSubmitButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionButton(context, 'Submit', Colors.blue[800], () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Opdconfirmationrecipt()),
            );
          }),
          _buildActionButton(context, 'Reset', Colors.red[600], () {
            // Reset logic can go here
          }),
          _buildActionButton(context, 'Back', Colors.grey[600], () {
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      BuildContext context, String label, Color? color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label,style: TextStyle(color: Colors.white),),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[900],
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
    );
  }
}
