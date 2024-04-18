import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/home_page.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/landing_page.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/login_page.dart';

import 'package:flutter_2024_aau_connectify/presentation/screens/signup_page.dart';

const String loginRoute = '/login_page';
const String homeRoute = '/home_page';
const String signupRoute = '/signup_page';
const String signupRoute2 = '/signup_page2';
const String landingpageRoute = '/landingpage_page';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case landingpageRoute:
      return MaterialPageRoute(builder: (context) => const LandingPage());
    case homeRoute:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case loginRoute:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case signupRoute:
      return MaterialPageRoute(builder: (context) => const SignUp());

    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
