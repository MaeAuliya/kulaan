import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/res/typography.dart';
import '../../../authentication/presentation/providers/user_provider.dart';
import '../../../cart/presentation/widgets/product_item.dart';
import '../providers/home_provider.dart';
import '../widgets/home_category_item.dart';

class HomeView extends StatelessWidget {
  final PageController controller;

  const HomeView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, provider, __) {
        if (provider.news == null) {
          return const SizedBox.shrink();
        }
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: context.heightScale * 16),
                  child: PageView.builder(
                    controller: controller,
                    itemCount: provider.news!.length,
                    onPageChanged: provider.updateNewsPage,
                    itemBuilder: (_, index) {
                      final news = provider.news![index];
                      return AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          double currentPage = controller.page ?? controller.initialPage.toDouble();

                          double distance = (currentPage - index).abs();

                          double scale = 1 - (distance * 0.15).clamp(0.0, 0.15);
                          double opacity = 1 - (distance * 0.25).clamp(0.0, 0.25);

                          return Opacity(
                            opacity: opacity,
                            child: Transform.scale(
                              scale: scale,
                              child: child,
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            news,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colours.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: context.heightScale * 16,
                  ),
                  child: Column(
                    spacing: context.heightScale * 16,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.widthScale * 20,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: context.widthScale * 12,
                              horizontal: context.widthScale * 16),
                          decoration: BoxDecoration(
                            color: Colours.white,
                            border: Border.all(color: Colours.greyTextFieldStroke),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Consumer<UserProvider>(
                            builder: (_, provider, __) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              spacing: context.widthScale * 24,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      spacing: context.widthScale * 4,
                                      children: [
                                        const Icon(
                                          Icons.location_on_rounded,
                                          color: Colours.greyTextFieldStroke,
                                          size: 14,
                                        ),
                                        CoreTypography.coreText(
                                          text:
                                              '${provider.currentUser!.location.city}, ${provider.currentUser!.location.address}',
                                          fontSize: 11,
                                          color: Colours.grey,
                                        )
                                      ],
                                    ),
                                    CoreTypography.coreText(
                                      text: 'Hello, ${provider.currentUser!.name}!',
                                      fontSize: 14,
                                      fontWeight: CoreTypography.semiBold,
                                      color: Colours.primaryBlue,
                                    )
                                  ],
                                ),
                                Material(
                                  child: InkWell(
                                    onTap: () {
                                      debugPrint('zzz');
                                    },
                                    highlightColor: Colours.blueVehicleDetailBackground,
                                    splashColor: Colours.blueVehicleDetailBackground,
                                    child: Container(
                                      padding: EdgeInsets.all(context.widthScale * 6),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colours.greyTextFieldStroke),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: const Icon(
                                        CupertinoIcons.cart,
                                        color: Colours.primaryBlue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.widthScale * 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          spacing: context.widthScale * 16,
                          children: [
                            const HomeCategoryItem(
                              name: 'All Product',
                              image: MediaRes.allProductIcon,
                            ),
                            const HomeCategoryItem(
                              name: 'Fast Food',
                              image: MediaRes.fastFoodIcon,
                            ),
                            const HomeCategoryItem(
                              name: 'Fruits',
                              image: MediaRes.fruitsIcon,
                            ),
                            const HomeCategoryItem(
                              name: 'Vegetables',
                              image: MediaRes.vegetableIcon,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: context.heightScale * 4,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.widthScale * 20,
                              ),
                              child: CoreTypography.coreText(
                                text: 'New Products',
                                fontSize: 16,
                                fontWeight: CoreTypography.bold,
                              ),
                            ),
                            (provider.recommendProducts == null)
                                ? const Expanded(
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          Colours.primaryBlue,
                                        ),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: ListView.builder(
                                      itemCount: provider.recommendProducts!.length,
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (_, index) {
                                        final product = provider.recommendProducts![index];
                                        if (index == 0) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              left: context.widthScale * 16,
                                              right: context.widthScale * 12,
                                            ),
                                            child: ProductItem(
                                              image: MediaRes.meatDummyImages,
                                              name: product.name,
                                              unit: '/ ${product.unit}',
                                              price: product.price.toString(),
                                              sellerName: product.seller?.businessName ?? '',
                                              onPlusTap: () {},
                                            ),
                                          );
                                        }
                                        return Padding(
                                          padding: EdgeInsets.only(right: context.widthScale * 12),
                                          child: ProductItem(
                                            image: MediaRes.meatDummyImages,
                                            name: product.name,
                                            unit: '/ ${product.unit}',
                                            price: product.price.toString(),
                                            sellerName: product.seller?.businessName ?? '',
                                            onPlusTap: () {},
                                          ),
                                        );
                                      },
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
