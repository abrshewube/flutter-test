import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import '../../widgets/announcement_card.dart';
import '../../widgets/announcement_catagory.dart';

class AnnouncementUserPage extends StatefulWidget {
  const AnnouncementUserPage({super.key});

  @override
  State<AnnouncementUserPage> createState() => AnnouncementUserPageState();
}

class AnnouncementUserPageState extends State<AnnouncementUserPage> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AnnouncementCatagory(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: ListView(
              children: [
                AnnouncementCard(
                    title: 'Trail 1',
                    images: 'assets/images/aau_logo.png',
                    date: DateTime.now(),
                    summary: 'This is a summary'),
                // Q: add more announcement cards here that feel real
                AnnouncementCard(
                  title: 'Trail 5',
                  images: 'assets/images/aau_logo.png',
                  date: DateTime.now(),
                  summary:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce auctor, mauris eget ultrices aliquet, nunc nisl tincidunt nunc, id lacinia nisl nunc id nunc. Sed auctor, nunc id tincidunt tincidunt, nunc nunc tincidunt nunc, id lacinia nunc nunc id nunc.',
                ),

                AnnouncementCard(
                  title: 'Trail 5',
                  images: 'assets/images/aau_logo.png',
                  date: DateTime.now(),
                  summary:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce auctor, mauris eget ultrices aliquet, nunc nisl tincidunt nunc, id lacinia nisl nunc id nunc. Sed auctor, nunc id tincidunt tincidunt, nunc nunc tincidunt nunc, id lacinia nunc nunc id nunc.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
