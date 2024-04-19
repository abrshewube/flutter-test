import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/typography.dart';

class LoginButtons extends StatelessWidget {
  final String login_route;
  final String signup_route;
  const LoginButtons({super.key, required this.login_route, required this.signup_route});

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
                Navigator.pushNamed(context, login_route);
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
                  onPressed: () => (Navigator.pushNamed(context, signup_route)),
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
