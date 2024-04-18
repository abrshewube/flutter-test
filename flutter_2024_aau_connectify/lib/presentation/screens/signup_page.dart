import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

void main() {
  runApp(const SignUp());
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        children: [
          Placeholder(
            fallbackHeight: 200,
          ),
          Text('Sign Up'), 
          TextField()


        ],
      ),
    ));
  }
}
