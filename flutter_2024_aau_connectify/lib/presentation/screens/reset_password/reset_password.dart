import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/heights.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/radiuses.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/typography.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/widths.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(CustomPaddings.large),
                      child: Column(
                        children: [
                          Text(
                            "Reset Your Password",
                            style: _textTheme.titleLarge!
                                .copyWith(fontSize: CustomFontSize.h3),
                          ),
                          const SizedBox(
                            height: CustomPaddings.extraLarge,
                          ),
                          // security question
                          Text(
                            "What is your favourite color? (Dummy Question)",
                            style: _textTheme.titleSmall!.copyWith(
                              fontSize: CustomFontSize.h4,
                            ),
                          ),
                          const SizedBox(
                            height: CustomPaddings.medium,
                          ),
                          const TextField(
                            decoration: InputDecoration(
                                hintText: "Your Security Question Answer",
                                contentPadding:
                                    EdgeInsets.all(CustomPaddings.medium)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: CustomPaddings.ultraLarge,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                            ButtonWidths.extraLarge, ButtonHeights.large),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, resetPasswordRoute2);
                      },
                      child: Text(
                        "Next",
                        style: _textTheme.button,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
