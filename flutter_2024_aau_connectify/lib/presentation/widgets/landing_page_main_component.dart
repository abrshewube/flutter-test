import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/radiuses.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/typography.dart';

class LandingPageMainComponent extends StatelessWidget {
  const LandingPageMainComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: CustomPaddings.small),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: CustomPaddings.large),
            child: CircleAvatar(
              backgroundColor: CustomColors.backgroundColor,
              radius: CustomRadius.ultimateLarge,
              backgroundImage: AssetImage('assets/images/aau_logo.png'),
            ),
          ),
          SizedBox(
            height: CustomPaddings.large,
          ),
          Text(
            textAlign: TextAlign.center,
            'Welcome to AAU Connectify',
            style: TextStyle(
                fontFamily: FontFamily.primary,
                fontSize: CustomFontSize.h3,
                fontWeight: FontWeight.w500,
                color: CustomColors.secondaryTextColor),
          ),
          SizedBox(
            height: CustomPaddings.medium,
          ),
          Text(
            textAlign: TextAlign.center,
            "Connect with Addis Ababa University's community. Explore opportunities through tailored announcements. Stay informed and empowered.",
            style: TextStyle(
                fontFamily: FontFamily.primary,
                fontSize: CustomFontSize.h7,
                fontWeight: FontWeight.w300,
                color: CustomColors.secondaryTextColor),
          ),
        ],
      ),
    );
  }
}
