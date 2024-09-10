import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // For date formatting
import 'opdRecipt.dart';  // Make sure this file exists in your project for OPDReceiptScreen


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
          'OPD Registration Preview',  // Updated title
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
                    color: Colors.blueGrey[300] ?? Colors.grey,  // Null safety
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
            fontSize: 18,
            color: Colors.blue[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Department Name: ENT (Mon, Wed, Fri, Sat)",
          style: TextStyle(fontSize: 16, color: Colors.blue[900]),
        ),
        SizedBox(height: 5),
        Text(
          "Date: ${DateFormat('dd-MM-yyyy').format(DateTime.now())}",
          style: TextStyle(fontSize: 16, color: Colors.blue[900]),
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
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _buildHardcodedField("Age", age)),
            SizedBox(width: 20),
            Expanded(child: _buildHardcodedField("Sex", sex)),
          ],
        ),
        SizedBox(height: 10),
        _buildHardcodedField("S/o", fatherName),
        _buildHardcodedField("Address", address),
        _buildHardcodedField("Complaints", complaints),
        _buildCheckboxField(),
        _buildCaptchaField(),
        SizedBox(height: 20),
        _buildSubmitButtons(context),
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

  Widget _buildCheckboxField() {
    return Row(
      children: [
        Checkbox(value: true, onChanged: (bool? value) {}),
        Expanded(
          child: Text("All the above information is correct."),
        ),
      ],
    );
  }

  Widget _buildCaptchaField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Captcha Code: 68951",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        TextFormField(  // Added TextFormField for user input
          decoration: InputDecoration(
            labelText: "Enter Image Characters",
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OPDReceiptScreen()),
              );
            },
            child: Text('Submit'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Reset'),
            // Optionally style the button if needed
            // style: ElevatedButton.styleFrom(primary: Colors.red),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'),
            // Optionally style the button if needed
            // style: ElevatedButton.styleFrom(primary: Colors.green),
          ),
        ],
      ),
    );
  }
}


