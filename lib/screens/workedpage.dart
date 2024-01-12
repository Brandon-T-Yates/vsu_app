import 'package:flutter/material.dart';
import '/constants/colors.dart';

class WorkedPage extends StatefulWidget {
  @override
  _WorkedPageState createState() => _WorkedPageState();
}

class _WorkedPageState extends State<WorkedPage> {
  bool weeklyChecked = false;
  bool biweeklyChecked = false;
  bool monthlyChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Hours Worked'),
        centerTitle: true,
      ),
      backgroundColor: appBackGroundGrey,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select the Time Frame to see what you worked',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 40),
            Text(
              'Total Hours Worked:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            // Add a widget to display the total hours worked, you can use a TextField, Text, or any other widget based on your needs

            SizedBox(height: 16),
            Text(
              'Select Time Frame:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            CheckboxListTile(
              title: Text('Weekly'),
              value: weeklyChecked,
              onChanged: (value) {
                setState(() {
                  weeklyChecked = value!;
                  biweeklyChecked = false;
                  monthlyChecked = false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Biweekly'),
              value: biweeklyChecked,
              onChanged: (value) {
                setState(() {
                  weeklyChecked = false;
                  biweeklyChecked = value!;
                  monthlyChecked = false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Monthly'),
              value: monthlyChecked,
              onChanged: (value) {
                setState(() {
                  weeklyChecked = false;
                  biweeklyChecked = false;
                  monthlyChecked = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
