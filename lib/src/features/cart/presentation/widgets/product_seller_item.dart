import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';
import '../../../../core/shared/widgets/core_divider.dart';

class ProductSellerItem extends StatelessWidget {
  final String image;
  final String name;
  final String stock;
  final String price;
  final String unit;
  final bool isStockAvailable;
  final VoidCallback onPlusTap;

  const ProductSellerItem({
    super.key,
    required this.image,
    required this.name,
    required this.unit,
    required this.price,
    required this.stock,
    required this.isStockAvailable,
    required this.onPlusTap,
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
          Expanded(
            child: Image.asset(
              image,
              height: context.heightScale * 48,
              fit: BoxFit.contain,
            ),
          ),
          const CoreDivider(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoreTypography.coreText(
                  text: name,
                  fontWeight: CoreTypography.bold,
                  fontSize: 14,
                  maxLine: 2,
                ),
                CoreTypography.coreText(
                  text: stock,
                  fontSize: 10,
                  color:
                      (isStockAvailable) ? Colours.diamond : Colours.errorColor,
                ),
                CoreTypography.coreText(
                  text: unit,
                  fontSize: 12,
                  color: Colours.grey,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: context.widthScale * 8,
                  children: [
                    Expanded(
                      child: CoreTypography.coreText(
                        text: 'Rp. $price',
                        fontWeight: CoreTypography.semiBold,
                        fontSize: 14,
                        color: Colours.darkBlue,
                      ),
                    ),
                    IgnorePointer(
                      ignoring: isStockAvailable == false,
                      child: ElevatedButton(
                        onPressed: onPlusTap,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          foregroundColor: Colours.white,
                          minimumSize: Size(
                            context.widthScale * 18,
                            context.widthScale * 32,
                          ),
                          backgroundColor: (isStockAvailable)
                              ? Colours.primaryBlue
                              : Colours.primaryBlue.withValues(alpha: 0.4),
                          padding: const EdgeInsets.all(8),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Icon(
                          CupertinoIcons.plus,
                          color: Colours.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
