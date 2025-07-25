class Constants {
  const Constants._();

  // Always using 'static' Variable
  static String exampleConstants = '';

  static String mapAccessToken =
      const String.fromEnvironment('MAPS_ACCESS_TOKEN');
}
