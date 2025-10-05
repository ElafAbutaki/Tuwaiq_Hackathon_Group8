import 'package:darkom/Feature_Properties_Screen/Controller/property_controller.dart';
import 'package:darkom/Feature__Lock_Screen/Screen/lock_screen.dart';
import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:darkom/App_Theme/app_sizes.dart';
import 'package:darkom/Feature_Properties_Screen/Screen/property_details_screen.dart';

/// Widget that displays a single property card in the property listing screen.
/// Each card shows property info, image, and a lock button that navigates to LockScreen.
class PropertyListItem extends StatelessWidget {
  final PropertyItem property;
  final VoidCallback? onTap;
  final VoidCallback? onKeyTap;

  const PropertyListItem({
    super.key,
    required this.property,
    this.onTap,
    this.onKeyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF1F1F1F),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.propertyCardRadius),
          bottomLeft: Radius.circular(AppSizes.propertyCardRadius),
          bottomRight: Radius.circular(AppSizes.propertyCardRadius),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        // Tap on card → navigate to Property Details
        onTap: onTap ??
            () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PropertyDetailsScreen(property: property),
                  ),
                ),
        child: Container(
          width: AppSizes.propertyCardWidth,
          constraints: const BoxConstraints(minHeight: 140),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --------- Property Info Section ---------
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Status chip (top-left of card)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _FilledStatusChip(
                        text: property.status.label,
                        color: property.status.color,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Property title
                    Text(
                      property.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.heading6,
                    ),

                    // City and district
                    Text(
                      '${property.city}، ${property.district}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppText.small2.copyWith(color: AppColors.dark300),
                    ),

                    // Price (right aligned)
                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                          style: AppText.small2.copyWith(
                            color: AppColors.dark300,
                          ),
                          children: [
                            TextSpan(
                              text: '${property.price.split(' ')[0]} ',
                              style: AppText.heading6.copyWith(
                                color: AppColors.emerald500,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: property.price.replaceFirst(
                                property.price.split(' ')[0],
                                '',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 2),

                    // Arrow icon at bottom-left
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'images/Property_Listings/propertyCard/propertyArrow.png',
                        width: AppSizes.arrowWidth,
                        height: AppSizes.arrowHeight,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // --------- Property Image + Lock Button ---------
              SizedBox(
                width: AppSizes.propertyImageWidth,
                height: AppSizes.propertyImageHeight,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Property image
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(AppSizes.propertyImageRadius),
                        bottomLeft:
                            Radius.circular(AppSizes.propertyImageRadius),
                        bottomRight:
                            Radius.circular(AppSizes.propertyImageRadius),
                      ),
                      child: Image.asset(
                        property.image ?? 'assets/images/default_property.png',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: const Color(0xFF2A2A2A),
                          alignment: Alignment.center,
                          child: const Icon(Icons.image, color: Colors.grey),
                        ),
                      ),
                    ),

                    // Lock button (bottom-right)
                    Positioned(
                      right: -10,
                      bottom: -8,
                      child: InkWell(
                        onTap: onKeyTap ??
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DoorLockScreen(
                                    propertyName: property.title,
                                  ),
                                ),
                              );
                            },
                        borderRadius: BorderRadius.circular(
                            AppSizes.lockCircleWidth),
                        child: Container(
                          width: AppSizes.lockCircleWidth,
                          height: AppSizes.lockCircleHeight,
                          decoration: BoxDecoration(
                            color: AppColors.emerald500,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.emerald500.withOpacity(.35),
                                blurRadius: 16,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                            'images/Property_Listings/propertyCard/lock.png',
                            width: AppSizes.lockWidth,
                            height: AppSizes.lockHeight,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Small colored status tag used in each property card.
class _FilledStatusChip extends StatelessWidget {
  final String text;
  final Color color;

  const _FilledStatusChip({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Text(
          text,
          style: AppText.small.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
