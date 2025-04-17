import 'package:centrifuge/centrifuge.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:synapsis/core/app/database_key.dart';
import 'package:synapsis/core/app/endpoint.dart';
import 'package:synapsis/core/service/database_service.dart';
import 'package:synapsis/core/service/env_service.dart';
import 'package:synapsis/core/util/core_function.dart';
import 'package:synapsis/presentations/component/component.dart';
import 'package:synapsis/presentations/dashboard/model/menu.dart';
import 'package:synapsis/presentations/dashboard/model/message.dart';
import 'package:synapsis/presentations/dashboard/model/message_notification.dart';
import 'package:synapsis/presentations/dashboard/model/send_message_body.dart';
import 'package:synapsis/presentations/dashboard/model/template_message.dart';
import 'package:synapsis/presentations/dashboard/repository/dashboard_repository.dart';
import 'package:synapsis/presentations/login/model/auth.dart';

class DashboardController extends GetxController with StateMixin<Auth> {
  final databaseService = Get.find<DatabaseService>();
  final DashboardRepository dashboardRepository = DashboardRepository();
  final location = latLng.LatLng(-6.2638947, 106.8761446);
  bool isShowActivity = false;
  bool isShowMessagePopup = false;
  MenuKey selectedMenuKey = MenuKey.home;
  final listMenu = [
    Menu(homeKey: MenuKey.setting, iconPath: "ic_setting.png"),
    Menu(homeKey: MenuKey.chart, iconPath: "ic_chart.png"),
    Menu(homeKey: MenuKey.message, iconPath: "ic_message.png"),
    Menu(homeKey: MenuKey.home, iconPath: "ic_home.png"),
  ];
  final List<String> listActivityMenu = [
    "IDLE",
    "HAULING",
    "LOADING",
    "HANGING",
    "DUMPING",
    "QUEUING",
    "MAINTENANCE",
  ];
  final List<TemplateMessage> listChatSuggest = [];
  MessageNotification? messageNotification;
  final List<Message> listMessage = [];
  final TextEditingController message = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void onReady() {
    onGetData();
    super.onReady();
  }

  onClickAvticity() {
    isShowActivity = true;
    update();
  }

  onBackActivity() {
    isShowActivity = false;
    update();
  }

  onClickMenu(MenuKey menuKey) async {
    switch (menuKey) {
      case MenuKey.message:
        selectedMenuKey = menuKey;
        onCloseMessagePopup();
        await onGetMessage();
        break;
      case MenuKey.home:
        selectedMenuKey = menuKey;
        break;
      default:
        Component.toast("Coming soon");
    }
    update();
  }

  onShowMessagePopup() {
    isShowMessagePopup = true;
    update();
  }

  onCloseMessagePopup() {
    isShowMessagePopup = false;
    update();
  }

  onGetData() async {
    change(null, status: RxStatus.loading());
    await dashboardRepository.templateMessage().then((value) async {
      listChatSuggest.addAll(value);
      var auth = await databaseService.read(Databasekey.auth);
      change(Auth.fromJson(auth), status: RxStatus.success());
      await onConnectWebSocket();
    });
  }

  onConnectWebSocket() async {
    var client = createClient(
      EnvService.websocketChannelUrl,
      config: ClientConfig(
        debug: true,
        privateChannelPrefix: EnvService.websocketPrefixChannelUrl,
        maxReconnectDelay: Duration(seconds: 30),
        pingInterval: Duration(seconds: 30),
        timeout: Duration(seconds: 60),
        tlsSkipVerify: true,
      ),
    );

    final subscriptionMessage = await client.getSubscription('${EnvService.websocketPrefixChannelUrl}${Endpoint.webSocketMessage}/${state?.unitId}');
    CoreFunction.logPrint("URL", "${EnvService.websocketChannelUrl}${Endpoint.webSocketMessage}/${state?.unitId}");
    subscriptionMessage.joinStream.listen((event) {
      CoreFunction.logPrint("JoinStream", event);
    });
    subscriptionMessage.subscribeSuccessStream.listen((event) {
      CoreFunction.logPrint("subscribeSuccessStream", event);
    });
    subscriptionMessage.publishStream.listen((event) async {
      CoreFunction.logPrint("publishStream", event);
      if (event.data.isNotEmpty) {
        await onGetMessage();
        if (selectedMenuKey != MenuKey.message) {
          messageNotification = MessageNotification.fromJson(CoreFunction.listIntToMap(event.data));
          onShowMessagePopup();
        }
      }
    });
    subscriptionMessage.leaveStream.listen((event) {
      CoreFunction.logPrint("leaveStream", event);
    });
    subscriptionMessage.unsubscribeStream.listen((event) {
      CoreFunction.logPrint("unsubscribeStream,", event);
    });
    subscriptionMessage.joinStream.listen((event) {
      CoreFunction.logPrint("joinStream", event);
    });
    await subscriptionMessage.subscribe();
    await client.connect();
  }

  onGetMessage() async {
    listMessage.clear();
    await dashboardRepository.messages().then((value) async {
      listMessage.addAll(value);
      update();
      Future.delayed(Duration(milliseconds: 100), () {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    });
  }

  onClickSuggestChat(int index) async {
    SendMessageBody sendMessageBody = SendMessageBody(
      categoryId: listChatSuggest[index].categoryId,
      message: listChatSuggest[index].name,
    );
    await onSendMessage(sendMessageBody);
  }

  onSendCustomMessage() async {
    SendMessageBody sendMessageBody = SendMessageBody(
      categoryId: "1",
      message: message.text,
    );
    await onSendMessage(sendMessageBody);
  }

  onSendMessage(SendMessageBody sendMessageBody) async {
    sendMessageBody.equipmentId = state?.unitId;
    sendMessageBody.deviceType = "Mobile";
    await dashboardRepository.sendMessage(sendMessageBody);
    await onGetMessage();
  }
}
