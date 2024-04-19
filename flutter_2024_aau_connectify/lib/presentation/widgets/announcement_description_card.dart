import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/typography.dart';

class AnnouncementDescriptionCard extends StatelessWidget {
  const AnnouncementDescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.left,
              "Announcement Sub Header",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: CustomFontSize.h4),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: CustomPaddings.medium,
                  bottom: CustomPaddings.small,
                  left: CustomPaddings.medium,
                  right: CustomPaddings.medium),
              child: Text(
                textAlign: TextAlign.justify,
                "Learn how to read a seedling's needs. Seedlings are like little sponges that need to absorb water and nutrients from their environment. Know your soil type. Soil types vary greatly depending on where you live. Knowing your local soil type will help you determine what kind of fertilizer",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
