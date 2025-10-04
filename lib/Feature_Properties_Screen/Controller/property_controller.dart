import 'package:darkom/App_Theme/app_colors.dart';
import 'package:flutter/material.dart';

enum PropertyStatus { available, lateExit, notAvailable }

extension PropertyStatusX on PropertyStatus {
  String get label => switch (this) {
        PropertyStatus.available    => 'متاح',
        PropertyStatus.lateExit  => 'خروج متأخر',
        PropertyStatus.notAvailable => 'غير متاح',
      };

  Color get color => switch (this) {
        PropertyStatus.available    => AppColors.emerald500,
        PropertyStatus.lateExit  => AppColors.lateExitColor,
        PropertyStatus.notAvailable => AppColors.notAvailableColor,
      };
}

class PropertyItem {
  final String title;
  final String city;
  final String district;
  final String price;          
  final PropertyStatus status;
  final String? image;

 
  final double lat;
  final double lng;

  const PropertyItem({
    required this.title,
    required this.city,
    required this.district,
    required this.price,
    required this.status,
    this.image,
    required this.lat,
    required this.lng,
  });
}
