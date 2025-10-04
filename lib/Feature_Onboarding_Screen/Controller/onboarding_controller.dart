import 'package:flutter/material.dart';

class OnboardingController {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> pages = [
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
}
