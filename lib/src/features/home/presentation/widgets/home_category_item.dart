import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';

class HomeCategoryItem extends StatelessWidget {
  final String image;
  final String name;

  const HomeCategoryItem({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.heightScale * 8,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(52, 52),
            padding: const EdgeInsets.all(8),
            shape: const CircleBorder(),
            backgroundColor: Colours.blueVehicleDetailBackground,
            elevation: 0,
            shadowColor: Colors.transparent,
          ),
          child: SizedBox(
            width: 32,
            height: 32,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        CoreTypography.coreText(
          text: name,
          fontWeight: CoreTypography.semiBold,
          fontSize: 10,
        )
      ],
    );
  }
}
