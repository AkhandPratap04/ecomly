import 'package:flutter/cupertino.dart';
import 'package:prakhya_ecomly/core/extensions/context_extensions.dart';

abstract class CoreUtils {
  static Color adaptiveColour(
    BuildContext context, {
    required Color lightModeColour,
    required Color darkModeColour,
  }) {
    return context.isDarkMode
        ? darkModeColour
        : lightModeColour;
  }
}
