import 'package:flutter/material.dart';
import 'package:darkom/Feature_Login_Screen/Screens/login_intro_screen.dart';

/// onboarding state and flow (paging + navigation).
class OnboardingController {
  // PageView controller.
  final PageController controller = PageController();

  // The currently visible page index.
  int currentIndex = 0;

  // Static content for the three onboarding pages.
  final List<Map<String, String>> pages = const [
    {
      "title": "إدارة أسهل لعقاراتك",
      "desc":
          "اعرض جميع عقاراتك في مكان واحد، وتابع الأرباح والعقارات الشاغرة بشكل فوري وواضح",
    },
    {
      "title": "الإخلاء بضغطة زر",
      "desc":
          "ضمن حقوقك وارفع طلب رسمي موثق عبر سمة أو تأخر المستأجر أو رفض الإخلاء بسرعة وسهولة",
    },
    {
      "title": "قفل ذكي وتقييم المستأجرين",
      "desc":
          "تحكم في الدخول والخروج دون وسيط، واطّلع على تقييم المستأجرين لاختيار الأنسب لعقارك بثقة",
    },
  ];

  // Update the index when the page changes.
  void setIndex(int index) => currentIndex = index;

  // Footer arrow: go to next page, or finish to LoginIntro.
  void goNextOrFinish(BuildContext context) {
    final last = currentIndex >= pages.length - 1;
    if (!last) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLoginIntro(context);
    }
  }

  // Skip button: jump directly to LoginIntro.
  void skip(BuildContext context) => _goToLoginIntro(context);

  void _goToLoginIntro(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginIntroScreen()),
    );
  }

  // Call from State.dispose().
  void dispose() => controller.dispose();
}
