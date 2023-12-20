import 'package:flutter/material.dart';
import 'homepage.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: SignUpForm(),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'First & Last Name'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Username'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
       SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Add sign-up logic here

            // Navigate to the HomePage after successful sign-up
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Text('Create'),
        ),
      ],
    );
  }
}