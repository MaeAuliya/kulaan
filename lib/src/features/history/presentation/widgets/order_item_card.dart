import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';

class OrderItemCard extends StatelessWidget {
  final num price;
  final String productName;
  final int quantity;

  const OrderItemCard({
    super.key,
    required this.price,
    required this.productName,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: context.width,
      decoration: BoxDecoration(
        color: Colours.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: context.heightScale * 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.heightScale * 4,
        children: [
          CoreTypography.coreText(
            text: productName,
            color: Colours.darkBlue,
            fontWeight: CoreTypography.bold,
          ),
          CoreTypography.coreText(
            text: 'quantity: $quantity',
            color: Colours.grey,
          ),
          CoreTypography.coreText(
            text: 'Rp.$price',
            color: Colours.primaryBlue,
            fontWeight: CoreTypography.bold,
          ),
        ],
      ),
    );
  }
}
