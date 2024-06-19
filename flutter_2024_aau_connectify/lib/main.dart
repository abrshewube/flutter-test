import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart' as route; // Adjust path as needed

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load custom theme data from JSON
  final themeStr = await rootBundle.loadString('assets/theme/custom_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(ProviderScope(
    child: AAUConnectifyApp(theme: theme),
  ));
}

class AAUConnectifyApp extends StatelessWidget {
  final ThemeData theme;

  const AAUConnectifyApp({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.controller, // Assuming route.controller generates routes correctly
      initialRoute: route.landingpageRoute, // Assuming route.landingpageRoute is defined correctly
      theme: theme,
    );
  }
}
