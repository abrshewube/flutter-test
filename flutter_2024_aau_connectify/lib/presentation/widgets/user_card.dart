import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/typography.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  const UserCard({super.key, required this.email, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/background_3.jpeg'),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: CustomFontSize.h4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: CustomFontSize.caption,
                      color: CustomColors.textGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          //add a full width button that says promote to admin
          ElevatedButton(
            onPressed: () {},
            child: const Text('Promote to Admin'),
          ),
          const Divider(),
        ],
      ),
    );
  }
}


class AdminCard extends StatelessWidget {
  final String name;
  final String email;
  const AdminCard({super.key, required this.email, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/background_3.jpeg'),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: CustomFontSize.h4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: CustomFontSize.caption,
                      color: CustomColors.textGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          //add a full width button that says promote to admin
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {},
            child: const Text('Demote to User'),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

