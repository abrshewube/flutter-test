import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/landing_page.dart';

void main(List<String> args) {
  runApp(const AAUConnectifyApp());

}

class AAUConnectifyApp extends StatelessWidget {
  const AAUConnectifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const LandingPage();
  }
}
