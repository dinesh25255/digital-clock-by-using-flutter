import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(DigitalClockApp());
}

class DigitalClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DigitalClock(),
    );
  }
}

class DigitalClock extends StatefulWidget {
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime(); // Call the _updateTime function when the widget is first created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Clock'),
      ),
      body: Center(
        child: Text(
          _currentTime,
          style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Function to update the current time every second
  void _updateTime() {
    setState(() {
      _currentTime = _getCurrentTime();
    });

    Timer(Duration(seconds: 1), _updateTime); // Schedule the next update after 1 second
  }

  // Helper function to get the current time in HH:mm:ss format
  String _getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = "${_formatTwoDigits(now.hour)}:${_formatTwoDigits(now.minute)}:${_formatTwoDigits(now.second)}";
    return formattedTime;
  }

  // Helper function to format the time units with leading zeros (e.g., 02 instead of 2)
  String _formatTwoDigits(int number) {
    return number.toString().padLeft(2, '0');
  }
}
