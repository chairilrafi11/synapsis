import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:synapsis/presentations/splashscreen/view/splashscreen_view.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/app/app_config.dart';
import 'core/service/database_service.dart';
import 'core/service/dio_service.dart';
import 'core/service/env_service.dart';
import 'core/util/core_function.dart';
import 'presentations/component/component.dart';

void main() async {
  await initServices();
  runApp(MyApp());
}

Future initServices() async {
  CoreFunction.logPrint('Services', 'Starting all services...');
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorPalette.blackText2,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  initializeDateFormatting(AppConfig.dateLocale);
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<EnvService>(() => EnvService().init(), permanent: true);
  await Get.putAsync<DatabaseService>(() => DatabaseService().init(), permanent: true);
  await Get.putAsync<DioService>(() => DioService().init(), permanent: true);
  await CoreFunction.versionInfo();
  CoreFunction.logPrint('Services', 'All services started...');
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      title: Constant.aplicationName,
      theme: Component.theme(),
      home: SplashscreenView(),
    );
  }
}
