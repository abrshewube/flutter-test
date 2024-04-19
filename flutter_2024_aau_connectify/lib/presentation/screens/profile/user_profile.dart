// profile page data used are , name , ID userName, Field Of study width button to edit profile

import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/heights.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/radiuses.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser(
      {super.key,
      required this.name,
      required this.id,
      required this.userName,
      required this.fieldOfStudy,
      required this.image});
  // return the user profile data
  final String name;
  final String id;
  final String userName;
  final String fieldOfStudy;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            minRadius: CustomRadius.extraLarge,
            maxRadius: CustomRadius.ultimateLarge,
          ),
          Padding(
            padding: const EdgeInsets.all(CustomPaddings.small),
            child: Text(
              'User Profile',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          Card(
            child: Container(
              height: 350,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Name: ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(name, style: Theme.of(context).textTheme.bodyLarge)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Field: ',
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text(fieldOfStudy,
                          style: Theme.of(context).textTheme.bodyLarge)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ID: ',
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text(id, style: Theme.of(context).textTheme.bodyLarge)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('User Name: ',
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text(userName,
                          style: Theme.of(context).textTheme.bodyLarge)
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: CustomPaddings.medium),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: CustomPaddings.small),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: Theme.of(context)
                                .elevatedButtonTheme
                                .style!
                                .copyWith(
                                  minimumSize: const MaterialStatePropertyAll(
                                    Size(double.infinity, ButtonHeights.medium),
                                  ),
                                ),
                            child: const Text('Edit'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: CustomPaddings.small),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style!
                                  .copyWith(
                                      minimumSize:
                                          const MaterialStatePropertyAll(
                                        Size(double.infinity,
                                            ButtonHeights.medium),
                                      ),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Theme.of(context).colorScheme.error)),
                              child: const Text('Log Out')),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
