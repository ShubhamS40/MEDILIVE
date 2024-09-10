import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/opd/previewRegistration.dart'; // For date formatting


class OPDRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Online OPD Registration System',
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
              width: screenWidth * 0.8, // Adjust the width to fit the screen
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Patient Details / रोगी का विवरण:",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
}

class OPDForm extends StatefulWidget {
  @override
  _OPDFormState createState() => _OPDFormState();
}

class _OPDFormState extends State<OPDForm> {
  final _formKey = GlobalKey<FormState>();
  String? hospital;
  String? department;
  String? sex;
  String? selectedIdType;

  // Date picker related
  TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate); // Formatting the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: "Select Hospital / अस्पताल चयन :"),
            items: ['Hospital A', 'Hospital B'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) => setState(() => hospital = newValue),
          ),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: "Select Department / विभाग चयन :"),
            items: ['Department A', 'Department B'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) => setState(() => department = newValue),
          ),
          SizedBox(height: 10),

          // Date picker TextFormField
          TextFormField(
            controller: _dateController,
            decoration: InputDecoration(
              labelText: "Date / दिनांक :",
              suffixIcon: Icon(Icons.calendar_today), // Add calendar icon
            ),
            readOnly: true, // User cannot manually enter date
            onTap: () => _selectDate(context), // Open the date picker on tap
          ),

          SizedBox(height: 20),
          Text(
            "Sex / लिंग:",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900]),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: const Text('Male / पुरुष'),
                  value: 'Male',
                  groupValue: sex,
                  onChanged: (value) {
                    setState(() {
                      sex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: const Text('Female / महिला'),
                  value: 'Female',
                  groupValue: sex,
                  onChanged: (value) {
                    setState(() {
                      sex = value;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(labelText: "Age / आयु (Years / Months / Days):"),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(labelText: "Address / पता :"),
            maxLines: 3,
          ),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: "Select ID Type"),
            items: ['Aadhar Card', 'Driving License'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) => setState(() => selectedIdType = newValue),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Enter ID Number / आईडी नंबर दर्ज करें :"),
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Mobile No. / मोबाइल नंबर :"),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Enter patient's complaints/problems / रोगी की शिकायत/परेशानिया दर्ज करें :",
            ),
            maxLines: 3,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Save the form data or submit it
              }

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OPDPreviewScreen())
              );

            },
            child: Text('Preview / प्रस्तुत करें'),
            style: ElevatedButton.styleFrom(
              // primary: Colors.blue[700], // Button color
            ),
          ),
        ],
      ),
    );
  }
}
