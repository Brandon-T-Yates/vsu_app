import 'package:flutter/material.dart';
import '../screens/loginpage.dart';
import 'constants/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VSU Work Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: appBackGroundGrey,
        ),
      ),
      home: LoginPage(),
    );
  }
}