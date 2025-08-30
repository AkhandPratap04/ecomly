import 'package:flutter/material.dart';
import 'package:prakhya_ecomly/core/res/styles/colours.dart';
import 'package:prakhya_ecomly/core/utils/core_utils.dart';

class AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: ColoredBox(
        color: CoreUtils.adaptiveColour(
          context,
          lightModeColour: Colors.white,
          darkModeColour: Colours.darkThemeDarkSharpColour,
        ),
        child: SizedBox(height: 1, width: double.maxFinite),
      ),
    );
  }

  @override
  Size get preferredSize => Size.zero;
}
