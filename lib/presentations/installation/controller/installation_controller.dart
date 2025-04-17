import 'dart:math';

import 'package:centrifuge/centrifuge.dart';
import 'package:get/get.dart';
import 'package:synapsis/core/service/websocket_service.dart';
import 'package:synapsis/core/util/core_function.dart';
import 'package:synapsis/presentations/installation/model/activation_notification.dart';
import 'package:synapsis/presentations/installation/repository/installation_repository.dart';
import 'package:synapsis/presentations/login/view/login_view.dart';

class InstallationController extends GetxController with StateMixin<String> {
  final InstallationRepository installationRepository = InstallationRepository();

  @override
  void onReady() {
    onCheckDevice();
    super.onReady();
  }

  String generateRandomId({int length = 12}) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    final randomString = List.generate(length, (index) => chars[rand.nextInt(chars.length)]).join();
    return 'SID$randomString';
  }

  onCheckDevice() async {
    change(generateRandomId(), status: RxStatus.loading());
    await installationRepository.checkDeviceById("TEST-chairil123").then((response) async {
      if (response != null) {
        if (response.isActive ?? false) {
          onNavToLogin();
        } else {
          change(state, status: RxStatus.success());
        }
      } else {
        change(state, status: RxStatus.success());
        await onConnectWebSocket();
      }
    });
  }

  onNavToLogin() => Get.to(() => LoginView());

  onConnectWebSocket() async {
    var client = createClient(
      "wss://dev-wss.apps-madhani.com/connection/websocket",
      config: ClientConfig(
        debug: true,
        privateChannelPrefix: 'ws/fms-dev',
        maxReconnectDelay: Duration(seconds: 30),
        pingInterval: Duration(seconds: 30),
        timeout: Duration(seconds: 60),
        tlsSkipVerify: true,
      ),
    );

    final subscription = await client.getSubscription('ws/fms-dev/equipments/devices/${state}/activated');
    subscription.joinStream.listen((event) {
      CoreFunction.logPrint("JoinStream", event);
    });
    subscription.subscribeSuccessStream.listen((event) {
      CoreFunction.logPrint("subscribeSuccessStream", event);
    });
    subscription.publishStream.listen((event) {
      CoreFunction.logPrint("publishStream", event);
      if (event.data.isNotEmpty) {
        ActivationNotification activationNotification = ActivationNotification.fromJson(CoreFunction.listIntToMap(event.data));
        if (activationNotification.isActive ?? false) {
          onNavToLogin();
        }
      }
    });
    subscription.leaveStream.listen((event) {
      CoreFunction.logPrint("leaveStream", event);
    });
    subscription.unsubscribeStream.listen((event) {
      CoreFunction.logPrint("unsubscribeStream,", event);
    });
    subscription.joinStream.listen((event) {
      CoreFunction.logPrint("joinStream", event);
    });
    await subscription.subscribe();
    await client.connect();
  }
}
