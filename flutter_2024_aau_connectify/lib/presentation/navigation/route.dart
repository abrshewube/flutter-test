import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/home_page.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/landing_page.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/login_page.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/reset_password/reset_password.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/reset_password/reset_password_2.dart';

import 'package:flutter_2024_aau_connectify/presentation/screens/sign_up_page/signup_page.dart';


const String loginRoute = '/login_page';
const String homeRoute = '/home_page';
const String signupRoute = '/signup_page';
const String signupRoute2 = '/signup_page2';
const String landingpageRoute = '/landingpage_page';
const String announcementUser = '/Announcement_user_page';
const String resetPasswordRoute = '/reset_password_page';
const String resetPasswordRoute2 = '/reset_password_page2';

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

    case resetPasswordRoute:
      return MaterialPageRoute(builder: (context) => const ResetPasswordPage());
    case resetPasswordRoute2:
      return MaterialPageRoute(
          builder: (context) => const ResetPasswordPage2());

    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
