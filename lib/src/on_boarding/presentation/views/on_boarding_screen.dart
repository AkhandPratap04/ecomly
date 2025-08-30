import 'package:flutter/material.dart';
import 'package:prakhya_ecomly/src/on_boarding/presentation/on_boarding_info_section.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: PageView(
            controller: pageController,
            children: [
              OnBoardingInfoSection.first(),
              OnBoardingInfoSection.second(),
            ],
          ),
        ),
      ),
    );
  }
}
