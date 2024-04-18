import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart'
    as route;
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/typography.dart';
import 'package:flutter_2024_aau_connectify/presentation/widgets/landing_page_main_component.dart';

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
                        LandingPageButtons(),
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

class LandingPageButtons extends StatelessWidget {
  const LandingPageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: CustomPaddings.medium),
      child: Column(
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 0.8,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.pushNamed(context, route.loginRoute);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.primaryColor,
                foregroundColor: CustomColors.backgroundColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(
                  fontFamily: FontFamily.primary,
                  fontSize: CustomFontSize.h4,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.backgroundColor,
                ),
              ),
              child: const Text('Login'),
            ),
          ),
          const SizedBox(
            height: CustomPaddings.small,
          ),
          // Registration option
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                  onPressed: () =>
                      (Navigator.pushNamed(context, route.signupRoute)),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: CustomColors.primaryColor,
                        fontSize: CustomFontSize.h6,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
