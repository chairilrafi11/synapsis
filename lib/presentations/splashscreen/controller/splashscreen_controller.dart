import 'package:synapsis/core/app/database_key.dart';
import 'package:get/get.dart';
import 'package:synapsis/core/service/database_service.dart';
import 'package:synapsis/presentations/dashboard/view/dashboard_view.dart';
import 'package:synapsis/presentations/installation/view/installation_view.dart';

class SplashscreenController extends GetxController {
  late final DatabaseService databaseService;
  @override
  void onReady() {
    checkSession();
    super.onReady();
  }

  Future checkSession() async {
    await 1.delay();
    databaseService = Get.find<DatabaseService>();
    if (databaseService.hasData(Databasekey.auth)) {
      Get.to(()=> DashboardView());
    } else {
      Get.offAll(() => InstallationView(), transition: Transition.fade);
    }
  }
}
