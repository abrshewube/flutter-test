import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/home_page.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/landing_page.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/login_page.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/signup_page.dart';

const String loginRoute = '/login';
const String homeRoute = '/home';
const String signupRoute = '/signup';
const String landingpageRoute = '/landingpage';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case landingpageRoute:
      return MaterialPageRoute(builder: (_) => LandingPage());
    case homeRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
    case loginRoute:
      return MaterialPageRoute(builder: (_) => LoginPage());
    case signupRoute:
      return MaterialPageRoute(builder: (_) => SignUp());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
