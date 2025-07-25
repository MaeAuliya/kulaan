import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';
import '../../domain/entities/post_order_params.dart';
import '../bloc/cart_bloc.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item.dart';

class CartSellerView extends StatelessWidget {
  const CartSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (_, provider, __) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(context.widthScale * 20),
              itemCount: provider.sellerCart.items.length,
              itemBuilder: (_, index) {
                final item = provider.sellerCart.items[index];
                return CartItem(
                  productName: item.productName,
                  sellerName: context.mapProvider.currentSeller!.businessName,
                  quantity: item.quantity,
                  subTotal: item.subTotal.toInt(),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: context.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: context.heightScale * 12,
              children: [
                CoreTypography.coreText(
                  text: 'Total : Rp.${provider.sellerCart.totalAmount.toInt()}',
                  fontSize: 18,
                  fontWeight: CoreTypography.bold,
                ),
                CoreTypography.coreText(
                  text:
                      'Send to: ${context.userProvider.currentUser!.location.address}, ${context.userProvider.currentUser!.location.district} ${context.userProvider.currentUser!.location.city}',
                  fontSize: 14,
                  maxLine: 2,
                  color: Colours.grey,
                  fontWeight: CoreTypography.medium,
                ),
                SizedBox(
                  width: context.width,
                  child: ElevatedButton(
                    onPressed: () {
                      final params = PostOrderParams(
                        buyerId: provider.sellerCart.userId,
                        sellerId: provider.sellerCart.sellerId,
                        totalAmount: provider.sellerCart.totalAmount,
                        address:
                            '${context.userProvider.currentUser!.location.address}, ${context.userProvider.currentUser!.location.district} ${context.userProvider.currentUser!.location.city}',
                        items: provider.sellerCart.items,
                      );

                      context.cartBloc.add(CreateOrderEvent(params));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colours.primaryBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: CoreTypography.coreText(
                      text: 'Order',
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
