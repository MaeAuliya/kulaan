import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';
import '../../../../core/shared/widgets/core_divider.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String name;
  final String sellerName;
  final String price;
  final String sellerLocation;

  const ProductItem({
    super.key,
    required this.image,
    required this.name,
    required this.sellerLocation,
    required this.price,
    required this.sellerName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.4,
      decoration: BoxDecoration(
        color: Colours.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 28,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            name,
            height: context.heightScale * 48,
            fit: BoxFit.cover,
          ),
          const CoreDivider(),
          Padding(
            padding: EdgeInsets.all(4),
            child: Column(
              children: [
                CoreTypography.coreText(
                  text: name,
                  fontWeight: CoreTypography.bold,
                  maxLine: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
