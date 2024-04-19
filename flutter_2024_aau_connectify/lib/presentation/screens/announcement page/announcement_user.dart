import 'package:flutter/material.dart';

import '../../widgets/announcement_catagory.dart';

class AnnouncementUserPage extends StatefulWidget {
  const AnnouncementUserPage({super.key});

  @override
  State<AnnouncementUserPage> createState() => AnnouncementUserPageState();
}

class AnnouncementUserPageState extends State<AnnouncementUserPage> {
  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'Announcement'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
  ];
  int _selectedIndex = 0;
  void _onTapBottomNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  

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
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarItems,
        currentIndex: _selectedIndex,
        onTap: _onTapBottomNav,
      ),
      body: const Column(
        children: [
          AnnouncementCatagory()
        ],
      ),
    );
  }
}
