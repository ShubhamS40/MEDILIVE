import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/component/NormalButton.dart';
import 'package:untitled1/opd/previewRegistration.dart'; // For date formatting

class OPDRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Online OPD Registration',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 4, // Adds a shadow below the app bar
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
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              width: screenWidth * 0.9, // Adjust the width to fit the screen
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
  TextEditingController _applicantNameController = TextEditingController();

  // Date picker related
  TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _applicantNameController.dispose();
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
          // Applicant Name
          TextFormField(
            controller: _applicantNameController,
            decoration: InputDecoration(
              labelText: "Applicant Name / आवेदक का नाम :",
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the applicant\'s name';
              }
              return null;
            },
          ),
          SizedBox(height: 20),

          // Hospital Dropdown
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: "Select Hospital / अस्पताल चयन :",
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            items: ['Hospital A', 'Hospital B'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) => setState(() => hospital = newValue),
          ),
          SizedBox(height: 20),

          // Department Dropdown
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: "Select Department / विभाग चयन :",
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            items: ['Department A', 'Department B'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) => setState(() => department = newValue),
          ),
          SizedBox(height: 20),

          // Date Picker
          TextFormField(
            controller: _dateController,
            decoration: InputDecoration(
              labelText: "Date / दिनांक :",
              suffixIcon: Icon(Icons.calendar_today, color: Colors.blue[900]),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            readOnly: true, // User cannot manually enter date
            onTap: () => _selectDate(context), // Open the date picker on tap
          ),

          SizedBox(height: 20),

          // Sex Selection
          Text(
            "Sex / लिंग:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: const Text('Male / पुरुष'),
                  value: 'Male',
                  groupValue: sex,
                  activeColor: Colors.blue[900],
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
                  activeColor: Colors.blue[900],
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

          // Age Input
          TextFormField(
            decoration: InputDecoration(
              labelText: "Age / आयु (Years / Months / Days):",
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),

          // Address Input
          TextFormField(
            decoration: InputDecoration(
              labelText: "Address / पता :",
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 20),

          // ID Type Dropdown
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: "Select ID Type",
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            items: ['Aadhar Card', 'Driving License'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) => setState(() => selectedIdType = newValue),
          ),
          SizedBox(height: 20),

          // ID Number Input
          TextFormField(
            decoration: InputDecoration(
              labelText: "Enter ID Number / आईडी नंबर दर्ज करें :",
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 20),

          // Mobile Number Input
          TextFormField(
            decoration: InputDecoration(
              labelText: "Mobile No. / मोबाइल नंबर :",
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 20),

          // Complaints/Problems Input
          TextFormField(
            decoration: InputDecoration(
              labelText: "Enter patient's complaints/problems / रोगी की शिकायत/परेशानिया दर्ज करें :",
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 20),

          // Submit Button
          NormalButton(text: 'Preview / प्रस्तुत करें',onPressed: ()=>{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OPDPreviewScreen()))
          },),
        ],
      ),
    );
  }
}
