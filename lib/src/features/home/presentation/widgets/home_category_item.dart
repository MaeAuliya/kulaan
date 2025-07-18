import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colours.blueVehicleDetailBackground,
          ),
          child: SvgPicture.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        CoreTypography.coreText(
          text: name,
          fontWeight: CoreTypography.semiBold,
        )
      ],
    );
  }
}
