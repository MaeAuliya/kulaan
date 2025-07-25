import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';

class CartItem extends StatelessWidget {
  final String productName;
  final String sellerName;
  final int quantity;
  final int subTotal;

  const CartItem({
    super.key,
    required this.productName,
    required this.sellerName,
    required this.quantity,
    required this.subTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: context.heightScale * 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.heightScale * 8,
        children: [
          CoreTypography.coreText(
            text: productName,
            fontSize: 14,
            fontWeight: CoreTypography.bold,
          ),
          CoreTypography.coreText(
            text: sellerName,
            fontWeight: CoreTypography.bold,
            color: Colours.primaryBlue,
          ),
          CoreTypography.coreText(
            text: 'Quantity: $quantity',
            fontWeight: CoreTypography.bold,
            color: Colours.grey,
          ),
          CoreTypography.coreText(
            text: 'Total: Rp. $subTotal',
            fontWeight: CoreTypography.bold,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
