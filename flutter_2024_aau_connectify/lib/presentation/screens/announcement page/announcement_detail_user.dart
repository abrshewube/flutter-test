import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/heights.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/typography.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/widths.dart';
import 'package:flutter_2024_aau_connectify/presentation/widgets/announcement_description_card.dart';
import 'package:flutter_2024_aau_connectify/presentation/widgets/announcement_detail_image_card.dart';
import 'package:flutter_2024_aau_connectify/presentation/widgets/appbar.dart';

class AnnouncementDetailUser extends StatefulWidget {
  const AnnouncementDetailUser({super.key});

  @override
  State<AnnouncementDetailUser> createState() => _AnnouncementDetailUserState();
}

class _AnnouncementDetailUserState extends State<AnnouncementDetailUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "post detail",
        actions: [],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: CustomPaddings.medium,
                bottom: CustomPaddings.small,
                left: CustomPaddings.small),
            child: Text(
              'Announcement Title',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: CustomFontSize.h3),
            ),
          ),
          const AnnouncementDetailImageCard(),
          const AnnouncementDescriptionCard(),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(CustomPaddings.medium),
              child: TextField(

                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  disabledBorder: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(),
                  hintText: 'Add a comment...',
                  
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(CustomPaddings.extraLarge),
            child: ElevatedButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                textStyle: MaterialStatePropertyAll(
                    Theme.of(context).textTheme.titleLarge),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                      horizontal: CustomPaddings.medium,
                      vertical: CustomPaddings.large),
                ),
              ),
              onPressed: () {
                // Add your logic for posting a comment here
              },
              child: const Text('Post Comment'),
            ),
          ),
          const Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://example.com/user_avatar.jpg'),
                ),
                title: Text('John Doe'),
                subtitle: Text('This is a comment from the user.'),
              ),
              Divider(),
            ],
          ),
           Column(
            children: [
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://example.com/user_avatar.jpg'),
                ),
                title: Text('John Doe'),
                subtitle: Text('This is a comment from the user.'),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //edit button
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Edit'),
                  ),
                  //delete button
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.error),
                    ),
                    onPressed: () {},
                    child: const Text('Delete'),
                  ),
                  
                ],

              ),
              const Divider(),
            ],

          ),
          const Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://example.com/user_avatar.jpg'),
                ),
                title: Text('John Doe'),
                subtitle: Text('This is a comment from the user.'),
              ),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
