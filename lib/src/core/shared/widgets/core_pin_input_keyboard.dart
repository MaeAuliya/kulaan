import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../res/colours.dart';
import 'core_keyboard_item.dart';

class CorePinInputKeyboard extends StatelessWidget {
  final void Function(String) onKeyTap;
  final VoidCallback onBackspace;

  const CorePinInputKeyboard({
    super.key,
    required this.onKeyTap,
    required this.onBackspace,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.widthScale * 24,
      children: [
        for (var row in [
          ['1', '2', '3'],
          ['4', '5', '6'],
          ['7', '8', '9'],
          ['', '0', '<'],
        ])
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: row.map((key) {
              return key == '<'
                  ? ElevatedButton(
                      onPressed: onBackspace,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colours.tripReviewBgColor,
                        foregroundColor: Colours.grey,
                        fixedSize: Size(
                          context.widthScale * 64,
                          context.widthScale * 64,
                        ),
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                      ),
                      child: Icon(
                        Icons.backspace_outlined,
                        color: Colours.grey,
                        size: context.widthScale * 24,
                      ),
                    )
                  : key.isNotEmpty
                      ? CoreKeyboardItem(
                          keyValue: key,
                          onKeyTap: onKeyTap,
                        )
                      : SizedBox.fromSize(
                          size: Size(
                            context.widthScale * 64,
                            context.widthScale * 64,
                          ),
                        );
            }).toList(),
          ),
      ],
    );
  }
}
