import 'package:flutter/material.dart';
import 'package:prakhya_ecomly/core/extensions/text_style_extensions.dart';

import '../../../core/res/media.dart';
import '../../../core/res/styles/colours.dart';
import '../../../core/res/styles/text.dart';

class OnBoardingInfoSection extends StatelessWidget {
  const OnBoardingInfoSection.first({super.key}) : first = true;

  const OnBoardingInfoSection.second({super.key}) : first = false;

  final bool first;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Image.asset(first ? Media.onBoardingFemale : Media.onBoardingMale),
        Column(
          children: [
            switch (first) {
              true => Text.rich(
                textAlign: TextAlign.left,
                TextSpan(
                  text: "${DateTime.now().year}\n",
                  style: TextStyles.headingBold.orange,
                  children: [
                    TextSpan(
                      text: "Winter Sale is live now.",
                      style: TextStyle(
                        color: Colours.classicAdaptiveTextColour(context),
                      ),
                    ),
                  ],
                ),
              ),
              _ => Text.rich(textAlign: TextAlign.left,
              TextSpan(
                text: "Flash Sale\n",
                style: TextStyles.headingBold.adaptiveColor(context),
                children: [
                  TextSpan(
                    text: "Men's",
                    style: TextStyle(color: Colours.lightThemeSecondaryTextColour),
                  ),
                  TextSpan(
                    text: " Shirts & Watches",
                    style: TextStyle(color: Colours.classicAdaptiveTextColour(context))
                  )
                ]
              ),
              ),
            },
          ],
        ),
      ],
    );
  }
}
