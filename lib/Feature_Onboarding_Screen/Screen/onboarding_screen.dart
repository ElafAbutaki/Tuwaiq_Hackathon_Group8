import 'package:darkom/Feature_Login_Screen/Screens/login_intro_screen.dart';
import 'package:darkom/Feature_Onboarding_Screen/Controller/onboarding_controller.dart';
import 'package:darkom/Feature_Onboarding_Screen/Widgets/emerald_arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final OnboardingController _onboardingController = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: PageView.builder(
                  controller: _onboardingController.controller,
                  itemCount: _onboardingController.pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _onboardingController.currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 40,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _onboardingController.pages[index]["title"]!,
                              textAlign: TextAlign.center,
                              style: AppText.heading4,
                            ),
                            SizedBox(height: 15),
                            Text(
                              _onboardingController.pages[index]["desc"]!,
                              textAlign: TextAlign.right,
                              style: AppText.paragraph.copyWith(
                                color: AppColors.dark300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: List.generate(
                _onboardingController.pages.length,
                (index) => Container(
                  margin: const EdgeInsets.all(4),
                  height: _onboardingController.currentIndex == index ? 16 : 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: _onboardingController.currentIndex == index
                        ? AppColors.light500
                        : AppColors.dark400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IntroCircleButton(
                    onPressed: () {
                      if (_onboardingController.currentIndex <
                          _onboardingController.pages.length - 1) {
                        _onboardingController.controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginIntroScreen()),
                        );
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) =>  LoginIntroScreen()),
                      );
                    },
                    child: const Text(
                      "تخطي",
                      style:
                          TextStyle(color: AppColors.light300, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
