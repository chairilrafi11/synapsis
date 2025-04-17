import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../app/constant.dart';

class EnvService extends GetxService {
  Future<EnvService> init() async {
    await dotenv.load(fileName: Constant.env);
    return this;
  }

  static bool isProduction = dotenv.getBool(Constant.isProduction, fallback: false);
  static bool debug = dotenv.getBool(Constant.debug, fallback: false);
  static String baseUrlProduction = dotenv.env[Constant.baseUrlProduction] ?? "";
  static String baseUrlStagging = dotenv.env[Constant.baseUrlStagging] ?? "";
  static String websocketChannelUrl = dotenv.env[Constant.websocketChannelUrl] ?? "";
  static String websocketPrefixChannelUrl = dotenv.env[Constant.websocketPrefixChannelUrl] ?? "";

  static String baseURL() {
    if (isProduction) {
      return baseUrlProduction;
    } else {
      return baseUrlStagging;
    }
  }

}
