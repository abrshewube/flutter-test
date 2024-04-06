import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/widgets/user_card.dart';

class AdminPage extends StatelessWidget {
  AdminPage({super.key});
  final List<Map<String, String>> user = [
    {'name': 'John Doe', 'email': 'johndoe@example.com'},
    {'name': 'Jane Smith', 'email': 'janesmith@example.com'},
    {'name': 'Michael Johnson', 'email': 'michaeljohnson@example.com'},
    {'name': 'Emily Davis', 'email': 'emilydavis@example.com'},
    {'name': 'David Wilson', 'email': 'davidwilson@example.com'},
    {'name': 'Michael Johnson', 'email': 'michaeljohnson@example.com'},
    {'name': 'Emily Davis', 'email': 'emilydavis@example.com'},
    {'name': 'David Wilson', 'email': 'davidwilson@example.com'},
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(children: [
            // a heading saying admins
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: CustomPaddings.large,
                  vertical: CustomPaddings.extraLarge),
              child: Text(
                "Users",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            Container(
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                vertical: BorderSide(width: 1),
              )),
              width: double.infinity,
              height: 400,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(
                  left: CustomPaddings.small,
                  right: MediaQuery.of(context).size.width * 0.1),
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  // Check if the inner list is at the bottom
                  if (notification is ScrollEndNotification &&
                      notification.metrics.pixels ==
                          notification.metrics.maxScrollExtent) {
                    // Notify the outer list to start scrolling
                    Scrollable.ensureVisible(
                      context,
                      alignment: 1.0,
                      duration: const Duration(milliseconds: 300),
                    );
                  }
                  return false; // Continue to dispatch the notification
                },
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return UserCard(
                      email: user[index]['email']!,
                      name: user[index]['name']!,
                    );
                  },
                  itemCount: user.length,
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: CustomPaddings.large,
                  vertical: CustomPaddings.extraLarge),
              child: Text(
                "Admins",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                vertical: BorderSide(width: 1),
              )),
              width: double.infinity,
              height: 400,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(
                  left: CustomPaddings.small,
                  right: MediaQuery.of(context).size.width * 0.1),
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return AdminCard(
                    email: user[index]['email']!,
                    name: user[index]['name']!,
                  );
                },
                itemCount: user.length,
              ),
            )
          ]),
        ),
        Positioned(
            bottom: 20,
            right: 20,
            child: Tooltip(
              exitDuration: const Duration(seconds: 1),
              message: 'Create Announcement',
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/create_announcement');
                },
                child: const Icon(Icons.add),
              ),
            ))
      ],
    );
  }
}
