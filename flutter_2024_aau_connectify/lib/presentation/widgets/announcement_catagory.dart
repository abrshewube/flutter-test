import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';

const announcement_categories = [
  "Academic",
  "Research",
  "Events",
  "Notices",
  "Internship",
  "Career"
];

class AnnouncementCatagory extends StatefulWidget {
  const AnnouncementCatagory({super.key});

  @override
  State<AnnouncementCatagory> createState() => _AnnouncementCatagoryState();
}

class _AnnouncementCatagoryState extends State<AnnouncementCatagory> {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: announcement_categories.length,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {},
              style: const ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
              child: Text(announcement_categories[index]));
          }),
    );
  }
}
