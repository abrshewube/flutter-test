import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart'
    as route;
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/typography.dart';
import 'package:flutter_2024_aau_connectify/presentation/widgets/landing_page_main_component.dart';
import 'package:flutter_2024_aau_connectify/presentation/widgets/login_buttons.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(CustomPaddings.small),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Main Component
                    LandingPageMainComponent(),
                    // Buttons
                    LoginButtons(
                        login_route: loginRoute, signup_route: signupRoute),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
