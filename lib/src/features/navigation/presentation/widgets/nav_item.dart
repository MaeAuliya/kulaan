import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.icon,
    required this.label,
    required this.onSelected,
  });

  final int currentIndex;
  final int index;
  final IconData icon;
  final String label;
  final void Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          onSelected(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: context.widthScale * 18,
              color:
                  currentIndex == index ? Colours.primaryBlue : Colours.navigationItemDisabledColor,
            ),
            CoreTypography.coreText(
                text: label,
                color: currentIndex == index
                    ? Colours.primaryBlue
                    : Colours.navigationItemDisabledColor,
                fontWeight: currentIndex == index ? CoreTypography.bold : CoreTypography.medium)
          ],
        ),
      ),
    );
  }
}
