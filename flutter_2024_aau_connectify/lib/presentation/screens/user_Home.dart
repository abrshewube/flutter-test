import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart'
    as route;
import 'package:flutter_2024_aau_connectify/presentation/screens/announcement%20page/announcement_user.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/profile/user_profile.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:flutter_2024_aau_connectify/presentation/widgets/announcement_card.dart';
import 'package:flutter_2024_aau_connectify/presentation/widgets/announcement_catagory.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
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

        appBar: 
        AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'AAU Connectify',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: CustomColors.secondaryTextColor),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _bottomNavBarItems,
          currentIndex: _selectedIndex,
          onTap: _onTapBottomNav,
        ),
        body: _selectedIndex == 0
            ? const AnnouncementUserPage()
            : const ProfileUser(
                name: 'John Doe',
                id: '123456',
                userName: 'johndoe',
                fieldOfStudy: 'Computer Science',
                image: 'assets/images/background_3.jpeg'));
  }
}
