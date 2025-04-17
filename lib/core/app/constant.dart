enum SnackType { success, info, error, warning }

enum BaseUrl { production, stagging }

enum ButtonType {
  primary,
  secondary,
  success,
  disabled,
  edit,
  cancel,
  warning,
  info,
  light,
  dark,
  link,
  outlinePrimary,
  outlineSecondary,
  outlineSuccess,
  outlineError,
  outlineWarning,
  outlineInfo,
  outlineLight,
  outlineDark,
  outlineLink,
}

enum TextTitleType { m1, m2, m3, l1, l2, l3, xl1, xl2, xl3, xxl1, xxl2, xxl3, xxxl1, xxxl2, xxxl3 }

enum TextBodyType { xs1, xs2, xs3, s19, s1, s2, s3, m1, m2, m3, l1, l2, l3 }

class Constant {
  static const String aplicationName = "Synapsis";
  static const String https = "https://";
  static const String http = "http://";
  static const String schemeWss = "wss";
  //* ENV
  static const String env = ".env";
  static const String debug = "DEBUG";
  static const String isProduction = "IS_PRODUCTION";
  static const String baseUrlProduction = "BASE_URL_PRODUCTION";
  static const String baseUrlStagging = "BASE_URL_STAGGING";
  static const String websocketChannelUrl = "WEBSOCKET_CHANNEL_URL";
  static const String websocketPrefixChannelUrl = "WEBSOCKET_PREFIX_CHANNEL_URL";

  static const String iconPath = "assets/icons/";
  static const String imagePath = "assets/images/";

  static const String idPath = ":id";

  // *
  static const String flutterMapUrl =  'https://tile.openstreetmap.org/{z}/{x}/{y}.png'; 

  static const String interRegular = "inter_regular";
  static const String interBold = "inter_bold";
  static const String interThin = "inter_thin";
  static const String interMedium = "inter_medium";

  static const int durationShimmer = 1200;
  static const Duration timeRequestApi = Duration(minutes: 1);
  static const Duration durationAnimationContainer = Duration(milliseconds: 600);

  static const String dateFormatYYYYMMDD = "yyyy-MM-dd";
  static const String dateFormatDDMMYYYYHHMMSS = "dd-MMM-yyyy_HH:mm:ss";
}
