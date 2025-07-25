import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/res/typography.dart';
import '../../../../core/shared/views/loading_view.dart';
import '../../../../core/utils/core_utils.dart';
import '../../data/models/core_cart_model.dart';
import '../../domain/entities/core_cart_item.dart';
import '../../domain/entities/core_cart_params.dart';
import '../bloc/cart_bloc.dart';
import '../providers/cart_provider.dart';
import '../screens/cart_seller_screen.dart';
import '../widgets/product_seller_item.dart';

class DetailSellerView extends StatelessWidget {
  final CartState currentState;

  const DetailSellerView({
    super.key,
    required this.currentState,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (_, provider, __) {
        if (provider.sellerProduct == null) {
          return const LoadingView(
            isTransparent: false,
          );
        } else {
          final seller = context.mapProvider.currentSeller!;
          return Stack(
            children: [
              Column(
                spacing: context.heightScale * 12,
                children: [
                  Container(
                    color: Colours.white,
                    padding: EdgeInsets.symmetric(
                        horizontal: context.widthScale * 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: context.heightScale * 6,
                      children: [
                        Row(
                          spacing: context.widthScale * 12,
                          children: [
                            CoreTypography.coreText(
                              text: 'Category : ',
                              fontWeight: CoreTypography.semiBold,
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
                                text: seller.businessType,
                                fontWeight: CoreTypography.medium,
                                color: Colours.primaryBlue,
                              ),
                            ),
                          ],
                        ),
                        CoreTypography.coreText(
                          text: seller.description,
                          maxLine: 3,
                        ),
                        CoreTypography.coreText(
                          text:
                              '${seller.location.address}, ${seller.location.district}, ${seller.location.city}',
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
                              text:
                                  '${seller.operatingTime.open} - ${seller.operatingTime.close}',
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
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: context.widthScale * 8,
                                mainAxisSpacing: context.heightScale * 4,
                                childAspectRatio:
                                    seller.operatingTime.days.length / 2,
                              ),
                              childrenDelegate: SliverChildBuilderDelegate(
                                (_, index) => Container(
                                  decoration: BoxDecoration(
                                    color: Colours.mediumRiskBgColor
                                        .withValues(alpha: 0.5),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  alignment: Alignment.center,
                                  child: CoreTypography.coreText(
                                    text: seller.operatingTime.days[index],
                                    fontWeight: CoreTypography.medium,
                                    fontSize: 10,
                                    color: Colours.mediumRiskColor,
                                  ),
                                ),
                                childCount: seller.operatingTime.days.length,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Consumer<CartProvider>(
                      builder: (_, provider, __) {
                        if (provider.sellerProduct == null) {
                          return const LoadingView(
                            isTransparent: false,
                          );
                        } else {
                          final sellerProduct = provider.sellerProduct!;
                          return GridView.custom(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                                horizontal: context.widthScale * 20),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: context.widthScale * 12,
                              mainAxisSpacing: context.heightScale * 16,
                              childAspectRatio: 0.6,
                            ),
                            childrenDelegate: SliverChildBuilderDelegate(
                              (_, index) {
                                final product = sellerProduct[index];
                                return ProductSellerItem(
                                  image: MediaRes.meatDummyImages,
                                  name: product.name,
                                  unit: '/ ${product.unit}',
                                  price: product.price.toString(),
                                  stock: 'Estimated Stock : ${product.stock}',
                                  isStockAvailable: product.stock > 0,
                                  onPlusTap: () {
                                    final cart = CoreCartItem(
                                      productId: product.id,
                                      productName: product.name,
                                      price: product.price,
                                      quantity: 1,
                                      subTotal: product.price,
                                    );
                                    final params = CoreCartParams(
                                      userId:
                                          context.userProvider.currentUser!.id,
                                      item: cart,
                                    );

                                    debugPrint(params.toString());

                                    context.cartBloc
                                        .add(PostItemToCartEvent(params));
                                  },
                                );
                              },
                              childCount: sellerProduct.length,
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Visibility(
                  visible: provider.sellerCart != CoreCartModel.empty(),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CartSellerScreen.routeName);
                    },
                    child: Container(
                      height: context.heightScale * 32,
                      padding: const EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: context.heightScale * 20),
                      decoration: BoxDecoration(
                        color: Colours.primaryBlue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      constraints: BoxConstraints(
                        minWidth: context.width * 0.5,
                        maxWidth: context.width * 0.55,
                      ),
                      child: Row(
                        spacing: context.widthScale * 12,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            spacing: context.widthScale * 4,
                            children: [
                              const Icon(
                                CupertinoIcons.cart,
                                color: Colours.white,
                                size: 18,
                              ),
                              CoreTypography.coreText(
                                text: CoreUtils.getTotalCount(
                                        provider.sellerCart.items)
                                    .toString(),
                                color: Colours.white,
                                fontWeight: CoreTypography.semiBold,
                                fontSize: 14,
                              ),
                            ],
                          ),
                          CoreTypography.coreText(
                            text: '|',
                            color: Colours.white,
                            fontWeight: CoreTypography.semiBold,
                            fontSize: 16,
                          ),
                          CoreTypography.coreText(
                            text:
                                'Rp. ${provider.sellerCart.totalAmount.ceil()}',
                            color: Colours.white,
                            fontWeight: CoreTypography.semiBold,
                            fontSize: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
