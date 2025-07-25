import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';

class SellerBottomSheet extends StatelessWidget {
  final String name;
  final String type;
  final String description;
  final String address;
  final String time;
  final List<String> operatingDays;
  final VoidCallback onVisitTap;
  final VoidCallback onDirectionTap;

  const SellerBottomSheet({
    super.key,
    required this.name,
    required this.type,
    required this.description,
    required this.address,
    required this.time,
    required this.operatingDays,
    required this.onVisitTap,
    required this.onDirectionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: context.height * 0.4,
          width: context.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(context.widthScale * 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: context.heightScale * 6,
            children: [
              Row(
                spacing: context.widthScale * 12,
                children: [
                  CoreTypography.coreText(
                    text: name,
                    fontWeight: CoreTypography.bold,
                    fontSize: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colours.blueVehicleDetailBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.widthScale * 12,
                      vertical: context.heightScale * 4,
                    ),
                    child: CoreTypography.coreText(
                      text: type,
                      fontWeight: CoreTypography.medium,
                      color: Colours.primaryBlue,
                    ),
                  ),
                ],
              ),
              CoreTypography.coreText(
                text: description,
                maxLine: 3,
              ),
              CoreTypography.coreText(
                text: address,
                fontSize: 10,
                color: Colours.grey,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: context.heightScale * 2,
                children: [
                  CoreTypography.coreText(
                    text: 'Operating Time',
                    fontSize: 11,
                    fontWeight: CoreTypography.semiBold,
                  ),
                  CoreTypography.coreText(
                    text: time,
                    fontSize: 11,
                    color: Colours.grey,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: context.heightScale * 8,
                children: [
                  CoreTypography.coreText(
                    text: 'Operating Days',
                    fontSize: 11,
                    fontWeight: CoreTypography.semiBold,
                  ),
                  GridView.custom(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: context.widthScale * 8,
                      mainAxisSpacing: context.heightScale * 4,
                      childAspectRatio: operatingDays.length / 2,
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (_, index) => Container(
                        decoration: BoxDecoration(
                          color:
                              Colours.mediumRiskBgColor.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: CoreTypography.coreText(
                          text: operatingDays[index],
                          fontWeight: CoreTypography.medium,
                          fontSize: 10,
                          color: Colours.mediumRiskColor,
                        ),
                      ),
                      childCount: operatingDays.length,
                    ),
                  ),
                ],
              ),
              Row(
                spacing: context.widthScale * 12,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onVisitTap,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colours.primaryBlue,
                        padding: EdgeInsets.symmetric(
                          horizontal: context.widthScale * 40,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadowColor: Colors.transparent,
                      ),
                      child: CoreTypography.coreText(
                        text: 'Visit',
                        color: Colors.white,
                        fontWeight: CoreTypography.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onDirectionTap,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colours.darkGreen,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.widthScale * 40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadowColor: Colors.transparent,
                    ),
                    child: CoreTypography.coreText(
                      text: 'Direction',
                      color: Colors.white,
                      fontWeight: CoreTypography.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
