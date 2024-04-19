import 'package:flutter/material.dart';


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
  int _selectedCatagory = 0;
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
              onPressed: () {
                setState(() {
                  _selectedCatagory = index;
                });
                //TODO add the code to handle fielter
              },
              style: ButtonStyle(
                shape: const MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(
                    index == _selectedCatagory
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).colorScheme.background),
                elevation: MaterialStatePropertyAll(
                    index == _selectedCatagory ? 23 : 1),
              ),
              child: Text(
                announcement_categories[index],
              ),
            );
          }),
    );
  }
}
