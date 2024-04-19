import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:json_theme/json_theme_schemas.dart';

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
                textStyle: MaterialStatePropertyAll(index == _selectedCatagory
                    ? Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: CustomColors.primaryColor)
                    : Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: CustomColors.secondaryTextColor)),
                shape: const MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(
                    index == _selectedCatagory
                        ? CustomColors.primaryColor
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
