import 'package:darkom/App_Theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_colors.dart';

class ChipsList extends StatefulWidget {
  const ChipsList({super.key});

  @override
  State<ChipsList> createState() => _FilterChipsDemoState();
}

class _FilterChipsDemoState extends State<ChipsList> {
  int selectedIndex = 0;

  final List<String> items = [
    "الكل",
    "الغير مقروءة",
    "السكان الحاليين",
    "المساكن",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final bool isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.emerald900 : Colors.transparent,
                  border: isSelected
                      ? Border.all(color: AppColors.emerald900, width: 1)
                      : Border.all(color: AppColors.light800, width: 1),
                  borderRadius: isSelected
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )
                      : BorderRadius.circular(20),
                ),
                child: Text(
                  items[index], 
                  style: AppText.small),
              ),
            );
          },
        ),
      ),
    );
  }
}