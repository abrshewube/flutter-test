import 'package:flutter/material.dart';

class AnnouncementUserPage extends StatefulWidget {
  const AnnouncementUserPage({super.key});

  @override
  State<AnnouncementUserPage> createState() => AnnouncementUserPageState();
}

class AnnouncementUserPageState extends State<AnnouncementUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AAU Connectify',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.black),
        ),
        centerTitle: true,
        
      ),
      bottomSheet:const BottomAppBar(
        
      ) ,
    );
  }
}
