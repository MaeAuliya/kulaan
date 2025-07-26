import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';
import '../../../cart/domain/entities/core_cart_item.dart';
import 'order_item_card.dart';

class OrderItem extends StatefulWidget {
  final String status;
  final String address;
  final String updatedAt;
  final String orderNumber;
  final String createdAt;
  final num totalAmount;
  final String sellerName;
  final List<CoreCartItem> items;

  const OrderItem({
    super.key,
    required this.orderNumber,
    required this.status,
    required this.address,
    required this.updatedAt,
    required this.createdAt,
    required this.totalAmount,
    required this.sellerName,
    required this.items,
  });

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.heightScale * 4,
        children: [
          CoreTypography.coreText(
            text: widget.sellerName,
            fontWeight: CoreTypography.bold,
            fontSize: 14,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colours.blueVehicleDetailBackground,
              borderRadius: BorderRadius.circular(6),
            ),
            child: CoreTypography.coreText(
              text: widget.status,
              color: Colours.primaryBlue,
            ),
          ),
          CoreTypography.coreText(
            text: widget.address,
            color: Colours.grey,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colours.greyEmptyImage),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colours.greyEmptyImage),
      ),
      backgroundColor: Colours.greySecondaryBackground,
      collapsedBackgroundColor: Colours.white,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 12),
      tilePadding: const EdgeInsets.all(12),
      onExpansionChanged: (isExpanded) {
        setState(() {
          _isExpanded = isExpanded;
        });
      },
      expandedAlignment: Alignment.centerLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in widget.items)
          OrderItemCard(
            price: item.price,
            productName: item.productName,
            quantity: item.quantity,
          ),
      ],
    );
  }
}
