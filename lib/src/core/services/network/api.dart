class API {
  final APIAuthentication authentication;
  final APIVerification verification;
  final APILocation location;
  final APIVoucher voucher;
  final APIBooking booking;
  final APITrip trip;
  final APIDefect defect;

  const API()
      : authentication = const APIAuthentication(),
        verification = const APIVerification(),
        location = const APILocation(),
        voucher = const APIVoucher(),
        booking = const APIBooking(),
        trip = const APITrip(),
        defect = const APIDefect();

  String get baseUrl => const String.fromEnvironment("BASE_URL");
}

class APIAuthentication {
  const APIAuthentication();

  String get signIn => const String.fromEnvironment("SIGN_IN");

  String get signInWithCredential =>
      const String.fromEnvironment("SIGN_IN_WITH_CREDENTIAL");

  String get createPassword => const String.fromEnvironment("CREATE_PASSWORD");

  String get userProfile => const String.fromEnvironment("USER_PROFILE");

  String get createPin => const String.fromEnvironment("CREATE_PIN");

  String get logout => const String.fromEnvironment("LOGOUT");

  String get validatePin => const String.fromEnvironment("VALIDATE_PIN");

  String get validatePassword =>
      const String.fromEnvironment("VALIDATE_PASSWORD");

  String get sendOTP => const String.fromEnvironment("SEND_OTP");

  String get verifyOtp => const String.fromEnvironment("VERIFY_OTP");

  String get resetPassword => const String.fromEnvironment("RESET_PASSWORD");

  String get deleteUser => const String.fromEnvironment("DELETE_USER");
}

class APIVerification {
  const APIVerification();

  String get uploadDocument => const String.fromEnvironment("UPLOAD_DOCUMENT");

  String get verificationDocument =>
      const String.fromEnvironment("VERIFICATION_DOCUMENT");
}

class APILocation {
  const APILocation();

  String get locationsImmediate =>
      const String.fromEnvironment("LOCATIONS_IMMEDIATE");

  String get locationsReservation =>
      const String.fromEnvironment("LOCATIONS_RESERVATION");

  String get vehicleBrand => const String.fromEnvironment("VEHICLE_BRAND");

  String get vehicleReservation =>
      const String.fromEnvironment("VEHICLE_RESERVATION");
}

class APIVoucher {
  const APIVoucher();

  String get vouchers => const String.fromEnvironment("VOUCHERS");
}

class APIBooking {
  const APIBooking();

  String get booking => const String.fromEnvironment("BOOKING");

  String get bookingImmediate =>
      const String.fromEnvironment("BOOKING_IMMEDIATE");

  String get bookingReservation =>
      const String.fromEnvironment("BOOKING_RESERVATION");

  String get immediateLimitCheck =>
      const String.fromEnvironment("BOOKING_IMMEDIATE_LIMIT_CHECK");

  String get reservationLimitCheck =>
      const String.fromEnvironment("BOOKING_RESERVATION_LIMIT_CHECK");

  String get history => const String.fromEnvironment("BOOKING_HISTORY");

  String get bookSetting => const String.fromEnvironment("BOOK_SETTING");
}

class APITrip {
  const APITrip();

  String get trip => const String.fromEnvironment("TRIP");

  String get startTrip => const String.fromEnvironment("START_TRIP");
}

class APIDefect {
  const APIDefect();

  String get defect => const String.fromEnvironment("DEFECT");

  String get defectVehicle => const String.fromEnvironment("DEFECT_VEHICLE");
}
