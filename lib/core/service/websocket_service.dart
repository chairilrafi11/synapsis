import 'package:get/get.dart';
import 'package:centrifuge/centrifuge.dart';
import 'package:synapsis/core/service/env_service.dart';
import 'package:synapsis/core/util/core_function.dart';

class WebsocketService extends GetxService {
  late Client client;

  init() async {
    final client = createClient(
      "wss://dev-wss.apps-madhani.com/connection/websocket",
      config: ClientConfig(
        debug: true,
        privateChannelPrefix: 'ws/fms-dev',
        maxReconnectDelay: Duration(seconds: 30),
        pingInterval: Duration(seconds: 30),
        retry: (value) {
          CoreFunction.logPrint("Retry", "event");
        },
        timeout: Duration(seconds: 60),
        tlsSkipVerify: true,
      ),
    );

    final subscription = await client.getSubscription('/equipments/devices/TEST-chairil123/activated');
    subscription.joinStream.listen((event) {
      CoreFunction.logPrint("JoinStream", event);
    });
    subscription.subscribeSuccessStream.listen((event) {
      CoreFunction.logPrint("subscribeSuccessStream", event);
    });
    subscription.publishStream.listen((event) {
      CoreFunction.logPrint("publishStream", event);
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
    return this;
  }
}
