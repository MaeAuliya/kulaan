import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/shared/views/loading_view.dart';
import '../providers/order_provider.dart';
import '../widgets/order_item.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (_, provider, __) {
        if (provider.userOrders == null) {
          return const LoadingView(
            isTransparent: false,
          );
        }
        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: provider.userOrders!.length,
            itemBuilder: (_, index) {
              final order = provider.userOrders![index];
              return OrderItem(
                orderNumber: order.orderNumber,
                status: order.status,
                address: order.address,
                updatedAt: order.updatedAt,
                createdAt: order.createdAt,
                totalAmount: order.totalAmount,
                sellerName: order.sellerName,
                items: order.items,
              );
            },
          ),
        );
      },
    );
  }
}
