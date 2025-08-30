import 'package:flutter/material.dart';
import 'package:prakhya_ecomly/core/extensions/text_style_extensions.dart';
import 'package:prakhya_ecomly/core/res/styles/colours.dart';
import 'package:prakhya_ecomly/core/res/styles/text.dart';

class EcomlyLogo extends StatelessWidget {
  const EcomlyLogo({super.key,  this.style});

  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Ecom",
        style: style ?? TextStyles.appLogo.white,
        children: [
          TextSpan(
            text: "ly",
            style: TextStyle(color: Colours.lightThemeSecondaryColour),
          ),
        ],
      ),
    );
  }
}
