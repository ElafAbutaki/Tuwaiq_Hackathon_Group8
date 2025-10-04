import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TealTickRing extends StatelessWidget {
  const TealTickRing({
    super.key,
    this.size = 320,
    this.totalSteps = 60,
    this.currentStep = 48,
    this.tickLength = 26,
    this.selectedColor = const Color(0xFF22C7B4),
    this.unselectedColor = const Color(0x3322C7B4),
    this.center,
  });

  final double size;
  final int totalSteps;
  final int currentStep;
  final double tickLength;              
  final Color selectedColor;
  final Color unselectedColor;
  final Widget? center;

  @override
  Widget build(BuildContext context) {
    final perStep = (2 * math.pi) / totalSteps;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularStepProgressIndicator(
            totalSteps: totalSteps,
            currentStep: currentStep.clamp(0, totalSteps),
            stepSize: tickLength,                
            padding: perStep * 0.78,              
            selectedColor: selectedColor,
            unselectedColor: unselectedColor,
            roundedCap: (index, isSelected) => false, 
          ),

         
          Container(
            width: size - tickLength * 2.35,      
            height: size - tickLength * 2.35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),

          if (center != null) center!,
        ],
      ),
    );
  }
}
