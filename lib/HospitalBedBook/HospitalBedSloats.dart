import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled1/HospitalBedBook/HospitalConfirmationRecipt.dart';
import 'package:untitled1/component/GradientColor.dart';

class AvailableSlotsPage extends StatefulWidget {
  @override
  _AvailableSlotsPageState createState() => _AvailableSlotsPageState();
}

class _AvailableSlotsPageState extends State<AvailableSlotsPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // A set of "Full" days for demonstration purposes
  final List<DateTime> _fullDays = [
    DateTime.utc(2024, 9, 20),
    DateTime.utc(2024, 9, 22),
    DateTime.utc(2024, 9, 24),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Bed Slots', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[900], // Set AppBar color to blue
        elevation: 0,
      ),
      body: GradientBackground(
        child: Row(
          children: [
            // Left Instructions Section
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select the available slots for bed",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildStep(Icons.local_hospital, "Select State/Hospital"),
                    _buildStep(Icons.check_circle_outline, "Select Mode of Booking"),
                    _buildStep(Icons.add, "Select Department"),
                    _buildStep(Icons.calendar_today, "Select Date of Booking"),
                    _buildStep(Icons.person, "Register/Login"),
                    _buildStep(Icons.sms, "Get Confirmation SMS"),
                  ],
                ),
              ),
            ),

            // Right Calendar Section
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView( // Add scrolling to avoid overflow
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Hospital Title
                        Text(
                          "AIIMS, New Delhi",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildCalendarLegends(),

                        // Constrain the height of the calendar
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.6, // Ensure it doesn't overflow
                          ),
                          child: TableCalendar(
                            firstDay: DateTime.utc(2020, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: _focusedDay,
                            calendarFormat: CalendarFormat.month,
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });

                              // Show confirmation dialog when a date is selected
                              _showConfirmationDialog(context, selectedDay);
                            },
                            calendarBuilders: CalendarBuilders(
                              defaultBuilder: (context, day, focusedDay) {
                                if (_fullDays.any((fullDay) => isSameDay(fullDay, day))) {
                                  return _buildCalendarCell(day, "Full", Colors.red); // Mark full days
                                }
                                return _buildCalendarCell(day, "Available Beds 220", Colors.green);
                              },
                              todayBuilder: (context, day, focusedDay) {
                                return _buildCalendarCell(day, "Today", Colors.blue);
                              },
                              selectedBuilder: (context, day, focusedDay) {
                                return _buildCalendarCell(day, "Selected", Colors.blue);
                              },
                              holidayBuilder: (context, day, focusedDay) {
                                return _buildCalendarCell(day, "Holiday", Colors.orange);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white), // Set icon color to white
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.white), // Set text color to white
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarLegends() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildLegend("Available", Colors.green),
        _buildLegend("Full", Colors.red),
        _buildLegend("Holiday", Colors.orange),
      ],
    );
  }

  Widget _buildLegend(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 8),
        Text(text),
      ],
    );
  }

  Widget _buildCalendarCell(DateTime day, String status, Color color) {
    return Container(
      margin: const EdgeInsets.all(2), // Reduced margin
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6), // Reduced padding
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${day.day}',
            style: TextStyle(color: Colors.white, fontSize: 14), // Reduced font size
          ),
          SizedBox(height: 2), // Add some spacing between day and status
          Text(
            status,
            style: TextStyle(color: Colors.white, fontSize: 10), // Reduced font size
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, DateTime selectedDay) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirm Booking"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Hospital: SRM HOSPITAL, New Delhi"),
              Text("Department: Cardology"),
              Text("Mode: Bed Booking For Treatement"),
              SizedBox(height: 10),

            ],
          ),
          actions: [
            GestureDetector( onTap:  () {
              Navigator.of(context).pop(); // Close the dialog
            },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text("Cancel",style: TextStyle(color: Colors.white),),
              ),
            ),
            GestureDetector(
              onDoubleTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HospitalConfirmationReceipt(registrationNo: "42223210078",patientName: "shubham", department: "Cardology", disease: "Heart Attack", phone: "7303298030", email: "shubham.0202.in@gmail.com", bedNo: "276", bookingDate: "22-06-18", address: "narela delhi")));
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text("Submit",style: TextStyle(color: Colors.white),),
              ),
onTap:  () {
        Navigator.of(context).pop(); // Close the dialog
        },          ),
          ],
        );
      },
    );
  }
}
