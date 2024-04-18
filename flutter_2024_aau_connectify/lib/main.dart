import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart'
    as route;

void main(List<String> args) {
  runApp(const AAUConnectifyApp());
}

class AAUConnectifyApp extends StatelessWidget {
  const AAUConnectifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.controller,
      initialRoute: route.landingpageRoute,
    );
  }
}
