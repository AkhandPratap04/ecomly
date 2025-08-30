import 'package:flutter/material.dart';
import 'package:prakhya_ecomly/core/common/widgets/ecomly_logo.dart';
import 'package:prakhya_ecomly/core/res/styles/colours.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.lightThemePrimaryColour,
      body: Center(child: EcomlyLogo()),
    );
  }
}
