import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
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
                  padding:
                      EdgeInsets.symmetric(vertical: context.heightScale * 16),
                  child: PageView.builder(
                    controller: controller,
                    itemCount: provider.news!.length,
                    onPageChanged: provider.updateNewsPage,
                    itemBuilder: (_, index) {
                      final news = provider.news![index];
                      return AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          double currentPage = controller.page ??
                              controller.initialPage.toDouble();

                          double distance = (currentPage - index).abs();

                          double scale = 1 - (distance * 0.15).clamp(0.0, 0.15);
                          double opacity =
                              1 - (distance * 0.25).clamp(0.0, 0.25);

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
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: context.heightScale * 16,
                    horizontal: context.widthScale * 20,
                  ),
                  child: Column(
                    spacing: context.heightScale * 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      )
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
