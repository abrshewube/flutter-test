import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/radiuses.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/typography.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LandingPageMainComponent extends StatelessWidget {
  const LandingPageMainComponent({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(top: CustomPaddings.small),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: CustomPaddings.large),
            child: CircleAvatar(
              backgroundColor: CustomColors.backgroundColor,
              radius: CustomRadius.ultimateLarge,
              backgroundImage: AssetImage('assets/images/aau_logo.png'),
            ),
          ),
          const SizedBox(
            height: CustomPaddings.large,
          ),
          const Text(
            textAlign: TextAlign.center,
            'Welcome to AAU Connectify',
            style: TextStyle(
                fontFamily: FontFamily.primary,
                fontSize: CustomFontSize.h3,
                fontWeight: FontWeight.w500,
                color: CustomColors.secondaryTextColor),
          ),
          const SizedBox(
            height: CustomPaddings.medium,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: CustomPaddings.medium),
            alignment: Alignment.center,
            child: AnimatedTextKit(animatedTexts: [
              TyperAnimatedText(
                textAlign: TextAlign.center,
                "Connect with Addis Ababa University's community. Explore opportunities through tailored announcements. Stay informed and empowered.",
                textStyle: _textTheme.bodyMedium!.copyWith(),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class TypewriterAnimatedTextKit {}
