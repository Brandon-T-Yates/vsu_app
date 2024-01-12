import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'schedulepage.dart';
import 'workedpage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClockIn = true;
  String currentDate = '';
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateDateTime();
  }

  void _updateDateTime() {
    setState(() {
      currentDate = DateFormat.yMd().format(DateTime.now());
      currentTime = DateFormat.Hm().format(DateTime.now());
    });
  }

  void _toggleClock() {
    setState(() {
      isClockIn = !isClockIn;
      _updateDateTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Study App'),
        centerTitle: true,
        automaticallyImplyLeading: false, 
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: const Text('Schedule'),
                  // Add functionality or route navigation for the Settings option
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SchedulePage()),
                    );
                  },
                ),
                PopupMenuItem(
                  child: const Text('Worked'),
                  // Add functionality or route navigation for the Settings option
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WorkedPage()),
                    );
                  },
                ),
                PopupMenuItem(
                  child: const Text('Logout'),
                  // Go to the previous screen when Logout is selected
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(40.0),
                child: Text(
                  'Welcome,',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(
                currentDate,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                currentTime,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleClock,
                child: Text(isClockIn ? 'Clock In' : 'Clock Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}