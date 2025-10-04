// lib/Feature_BottomNav/widgets/pop_nav_bar.dart
import 'package:flutter/material.dart';

class NavItem {
  final String iconPath;
  final String label;
  const NavItem({required this.iconPath, required this.label});
}

class PopNavBar extends StatelessWidget {
  final int currentIndex;
  final List<NavItem> items;
  final ValueChanged<int> onTap;

  final Color barColor;
  final Color activeCircleColor;
  final Color activeLabelColor;
  final Color inactiveIconColor;
  final Color inactiveLabelColor;

  const PopNavBar({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
    this.barColor = const Color(0xFF2B2F33),
    this.activeCircleColor = const Color(0xFF21C7B6),
    this.activeLabelColor = const Color(0xFF21C7B6),
    this.inactiveIconColor = const Color(0xFF8A8F94),
    this.inactiveLabelColor = const Color(0xFF8A8F94),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      color: barColor,
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final active = i == currentIndex;
          final item = items[i];
    
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onTap(i),
            child: SizedBox(
              width: (MediaQuery.of(context).size.width) / items.length,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none, 
                children: [
                  if (active)
                    Positioned(
                      top: -20,
                      child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: activeCircleColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: activeCircleColor.withOpacity(.6),
                              blurRadius: 30,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            item.iconPath,
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
    
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!active)
                        Image.asset(
                          item.iconPath,
                          width: 24,
                          height: 24,
                          color: inactiveIconColor,
                        )
                      else
                        const SizedBox(height: 24), 
                      const SizedBox(height: 6),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: active ? activeLabelColor : inactiveLabelColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
