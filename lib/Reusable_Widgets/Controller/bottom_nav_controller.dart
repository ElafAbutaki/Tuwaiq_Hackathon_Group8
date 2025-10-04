import 'package:flutter/material.dart';

class BottomNavController {
  final currentIndex = ValueNotifier<int>(0);

  void setIndex(int i) => currentIndex.value = i;
  void dispose() => currentIndex.dispose();
}
