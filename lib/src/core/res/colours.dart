import 'dart:ui';

class Colours {
  const Colours._();

  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF111827);

  static const Color grey = Color(0xFF6C7278);

  static const Color hintText = Color(0xFFABB1BB);

  static const Color primaryBlue = Color(0xFF2F80ED);

  static const Color darkBlue = Color(0xFF092C4C);

  static const Color errorColor = Color(0xFFEB5757);

  static const Color redOrderColor = Color(0xFFAF4B4B);

  static const Color statusBarColor = Color(0xFF4E5257);

  static const Color greyTextFieldStroke = Color(0xFFD1D5DB);

  static const Color greyEmptyImage = Color(0xFFD9D9D9);

  static const Color greyImageBox = Color(0xFFFAFAFA);

  static const Color navigationItemDisabledColor = Color(0xFF828282);

  static const Color greenSuccess = Color(0xFFE0FFE0);

  static const Color darkGreen = Color(0xFF589E67);

  static const Color successSnackBar = Color(0xFF6DBE7F);

  static const Color verifyColor = Color(0xFFD4E5FC);

  static const Color pendingBgColor = Color(0xFFFFF3D9);

  static const Color pendingColor = Color(0xFFE9AE2F);

  static const Color detailMarkerColor = Color(0xFF73A9F3);

  static const Color greySecondaryBackground = Color(0xFFFBFBFB);

  static const Color blueVehicleDetailBackground = Color(0xFFF8FAFE);

  static const Color greyFilterBackground = Color(0xFFF3F3F3);

  static const Color greenSelectedBanner = Color(0xFF8BC149);

  static const Color orangeColor = Color(0xFFE8730C);

  static const Color orangeSecondaryColor = Color(0xFFFFDAB9);

  static const Color orangeTertiaryColor = Color(0xFFFFEAD8);

  static const Color redSecondaryColor = Color(0xFFF7EDED);

  static const Color greyWaitingColor = Color(0xFFE4E4E4);

  static const Color greyOrderColor = Color(0xFFABABAB);

  static const Color greyExpansionColor = Color(0xFFE6E6E6);

  static const Color tripReviewBgColor = Color(0xFFF9F9F9);

  static const Color starColor = Color(0xFFFB9506);

  static const Color boardingDarkBlueColor = Color(0xFF2A4C70);

  static const Color reservedBgColor = Color(0xFFFAE2FF);

  static const Color reservedColor = Color(0xFFB100D4);

  static const Color rejectedColor = Color(0xFFE56695);

  static const Color rejectedBgColor = Color(0xFFEDDAE1);

  static const Color tripIconDisableColor = Color(0xFFD5D5D5);

  static const Color areaFieldColor = Color(0xFF4B87C6);

  static const Color mediumRiskBgColor = Color(0xFFFFD4AF);

  static const Color mediumRiskColor = Color(0xFFF57404);

  static const Color orderSuccessGreen = Color(0xFF0AA759);

  static const Color orderSuccessBlueBg = Color(0xFFF3F9FF);

  static const Color newEntryBg = Color(0xFFE8FFCD);

  static const Color newEntry = Color(0xFF8BC149);

  static const Color bronzeBg = Color(0xFFFEF2E7);

  static const Color bronze = Color(0xFFCD7F32);

  static const Color silverBg = Color(0xFFF8F8F8);

  static const Color silver = Color(0xFFB8B1B1);

  static const Color goldBg = Color(0xFFFFF6C3);

  static const Color gold = Color(0xffFDC300);

  static const Color diamondBg = Color(0xFFF2FCFF);

  static const Color diamond = Color(0xFF0B98C8);

  static const Color platinumBg = Color(0xFF737272);
}

extension ColorUtils on Color {
  int toInt() {
    final alpha = (a * 255).toInt();
    final red = (r * 255).toInt();
    final green = (g * 255).toInt();
    final blue = (b * 255).toInt();
    // Combine the components into a single int using bit shifting
    return (alpha << 24) | (red << 16) | (green << 8) | blue;
  }
}
