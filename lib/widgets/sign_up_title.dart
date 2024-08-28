import 'package:flutter/material.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Hi',
          style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
        ),
        Text(
          'Create an account',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}