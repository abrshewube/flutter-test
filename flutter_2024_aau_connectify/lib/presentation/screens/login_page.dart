import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/heights.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/radiuses.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/widths.dart';
import 'package:json_theme/json_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                Padding(
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
                SizedBox(
                  height: CustomPaddings.extraUltraLarge,
                ),
                Text(
                  "Login To Your Account",
                  style: _textTheme.titleLarge,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(CustomPaddings.large),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  hintText: "Username",
                                  contentPadding:
                                      EdgeInsets.all(CustomPaddings.small)),
                            ),
                            SizedBox(
                              height: CustomPaddings.medium,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  suffixIcon: Icon(Icons.visibility),
                                  contentPadding:
                                      EdgeInsets.all(CustomPaddings.small)),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: _textTheme.button!.copyWith(
                            color: CustomColors.primaryColor,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(ButtonWidths.large, ButtonHeights.large),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: _textTheme.button,
                        ),
                      ),
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
