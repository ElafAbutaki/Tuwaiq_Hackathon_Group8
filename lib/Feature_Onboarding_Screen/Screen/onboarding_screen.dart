import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_sizes.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:darkom/Feature_Onboarding_Screen/Controller/onboarding_controller.dart';
import 'package:darkom/Feature_Onboarding_Screen/Widgets/emerald_arrow_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final OnboardingController _onboardingController = OnboardingController();

  // Per-page image path + sizes 
  final List<(String path, double w, double h)> _imgData = [
    ('images/OnBoarding/Onboarding1.png', AppSizes.onboardingWidth1, AppSizes.onboardingHeight1),
    ('images/OnBoarding/Onboarding2.png', AppSizes.onboardingWidth2, AppSizes.onboardingHeight2),
    ('images/OnBoarding/Onboarding3.png', AppSizes.onboardingWidth3, AppSizes.onboardingHeight3),
  ];

  @override
  void dispose() {
    _onboardingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // -------- PAGES --------
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: PageView.builder(
                  controller: _onboardingController.controller,
                  itemCount: _onboardingController.pages.length,
                  onPageChanged: (i) => setState(() => _onboardingController.setIndex(i)),
                  itemBuilder: (context, index) {
                    final (path, w, h) = _imgData[index];
                    final page = _onboardingController.pages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40), 
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(path, width: w, height: h, fit: BoxFit.contain),
                            ),
                            const SizedBox(height: 20), 
                            Text(page["title"]!, textAlign: TextAlign.center, style: AppText.heading4),
                            const SizedBox(height: 10),
                            Text(
                              page["desc"]!,
                              textAlign: TextAlign.right,
                              style: AppText.paragraph.copyWith(color: AppColors.dark300),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 10),
            // -------- DOTS --------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: List.generate(
                _onboardingController.pages.length,
                (i) => Container(
                  margin: EdgeInsets.all(4),
                  height: _onboardingController.currentIndex == i ? 16 : 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: _onboardingController.currentIndex == i
                        ? AppColors.light500
                        : AppColors.dark400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            // -------- FOOTER (Arrow + Skip) --------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IntroCircleButton(
                    onPressed: () => _onboardingController.goNextOrFinish(context),
                  ),
                  TextButton(
                    onPressed: () => _onboardingController.skip(context),
                    child: const Text(
                      "تخطي",
                      style: TextStyle(color: AppColors.light300, fontSize: 18),
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
