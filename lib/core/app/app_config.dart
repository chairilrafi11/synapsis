class AppConfig {
  //* Config API
  static const String cacheControl = "no-cache";
  static const String contentType = "application/json";
  static const String contentTypeUrlEncoded = "application/x-www-form-urlencoded";

  //* Config Time
  static const int durationShimmer = 1200;
  static const Duration timeRequestApi = Duration(seconds: 30);
  static const Duration timeRequestFace = Duration(seconds: 60);
  static const Duration durationBounce = Duration(milliseconds: 800);

  //* Config Date Locale
  static const String dateLocale = "id";
}
