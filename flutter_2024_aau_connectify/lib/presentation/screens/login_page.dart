import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/user_Home.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/heights.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/radiuses.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/typography.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/widths.dart';
import 'package:json_theme/json_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: CustomPaddings.large),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: CustomPaddings.small),
                  child: CircleAvatar(
                    backgroundColor: CustomColors.backgroundColor,
                    radius: CustomRadius.ultimateLarge,
                    backgroundImage: AssetImage('assets/images/aau_logo.png'),
                  ),
                ),
                Text(
                  "AAU Connectify",
                  style: _textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: CustomPaddings.extraUltraLarge,
                ),
                Text(
                  "Login To Your Account",
                  style: _textTheme.titleLarge,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(CustomPaddings.large),
                        child: Column(
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                  hintText: "Username",
                                  contentPadding:
                                      EdgeInsets.all(CustomPaddings.medium)),
                            ),
                            const SizedBox(
                              height: CustomPaddings.medium,
                            ),
                            TextField(
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        right: CustomPaddings.small),
                                    child: IconButton(
                                      icon: Icon(
                                          _obscureText
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: CustomColors.primaryColor),
                                      onPressed: _togglePasswordVisibility,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.all(
                                      CustomPaddings.medium)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: CustomPaddings.extraUltraLarge,
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, resetPasswordRoute);
                            },
                            child: Text(
                              "Forgot Password?",
                              style: _textTheme.button!.copyWith(
                                color: CustomColors.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: CustomPaddings.small,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(
                                  ButtonWidths.extraLarge, ButtonHeights.large),
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                  (Route<dynamic> route) => false);
                            },
                            child: Text(
                              "Login",
                              style: _textTheme.button,
                            ),
                          ),
                          SizedBox(
                            height: CustomPaddings.small,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?"),
                              TextButton(
                                  onPressed: () => (Navigator.pushNamed(
                                      context, signupRoute)),
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
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
