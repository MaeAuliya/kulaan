import 'package:flutter/material.dart';

import '../../features/cart/domain/entities/core_cart_item.dart';
import '../extensions/context_extension.dart';
import '../res/colours.dart';
import '../res/typography.dart';
import '../shared/views/loading_view_dialog.dart';

class CoreUtils {
  const CoreUtils._();

  // Always using 'static' Functions here
  static String exampleFunction() => '';

  static void showSnackBar({
    required BuildContext context,
    required String message,
    String title = 'Success',
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            spacing: context.widthScale * 8,
            children: [
              Container(
                width: context.widthScale * 24,
                height: context.widthScale * 24,
                decoration: BoxDecoration(
                    color: Colours.white,
                    borderRadius: BorderRadius.circular(6)),
                alignment: Alignment.center,
                child: Icon(
                  isError ? Icons.close_rounded : Icons.check_rounded,
                  color: isError ? Colours.errorColor : Colours.successSnackBar,
                  size: context.widthScale * 16,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoreTypography.coreText(
                      text: isError ? 'Error' : title,
                      color: Colours.white,
                      fontWeight: FontWeight.bold,
                    ),
                    CoreTypography.coreText(
                      text: message,
                      color: Colours.white,
                      maxLine: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor:
              isError ? Colours.errorColor : Colours.successSnackBar,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          behavior: SnackBarBehavior.floating,
          // showCloseIcon: true,
          // closeIconColor: Colours.white,
        ),
      );
  }

  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;
        },
        child: const LoadingViewDialog(),
      ),
    );
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '* Email tidak boleh kosong';
    }

    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    if (!emailRegex.hasMatch(value)) {
      return '* Format email tidak valid';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '* Password tidak boleh kosong';
    }

    if (value.length < 8) {
      return '* Password minimal 8 karakter';
    }

    return null;
  }

  static int getTotalCount(List<CoreCartItem> cartItem) {
    final totalPrice = cartItem.fold<double>(
      0,
      (sums, item) => sums + item.quantity,
    );

    return totalPrice.ceil();
  }
}
