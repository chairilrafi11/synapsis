import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:synapsis/core/app/dimens.dart';
import 'package:synapsis/core/util/size_config.dart';
import 'package:synapsis/domain/usecase/data_usecase.dart';
import 'package:synapsis/presentations/component/component.dart';
import 'package:synapsis/presentations/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:synapsis/presentations/dashboard/model/menu.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder(
          init: DashboardController(),
          builder: (controller) {
            return controller.obx(
              (state) {
                return Stack(
                  children: [
                    AbsorbPointer(
                      absorbing: true,
                      child: FlutterMap(
                        options: MapOptions(
                          minZoom: 19,
                          maxZoom: 19,
                          initialZoom: 19,
                          interactionOptions: InteractionOptions(
                            debugMultiFingerGestureWinner: false,
                            enableMultiFingerGestureRace: false,
                          ),
                          initialCenter: controller.location,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: Constant.flutterMapUrl,
                            userAgentPackageName: 'com.poj.attendance',
                          ),
                          CircleLayer(
                            circles: [
                              CircleMarker(
                                color: ColorPalette.primary.withAlpha(100),
                                point: controller.location,
                                radius: 25,
                                useRadiusInMeter: true,
                              ),
                            ],
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: controller.location,
                                child: const Icon(
                                  Icons.navigation,
                                  color: ColorPalette.primary,
                                  size: Dimens.iconSizeMedium,
                                ),
                                rotate: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: SizeConfig.blockSizeHorizontal * 100,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: Dimens.padding10,
                            color: ColorPalette.black,
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Component.textTitle(
                                  "${state?.name} ${state?.siteName} ${state?.unitCode} ${state?.roleName}",
                                  colors: ColorPalette.white,
                                  type: TextTitleType.m1,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: switch (controller.selectedMenuKey) {
                              MenuKey.home => Container(
                                  padding: Dimens.padding10,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: ColorPalette.greyBackground2,
                                              borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  padding: Dimens.padding10,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: ColorPalette.black,
                                                    borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                        Constant.iconPath + "ic_speed.png",
                                                        height: Dimens.iconSizeSmall20,
                                                      ),
                                                      Dimens.marginVerticalSmall(),
                                                      Component.textBody(
                                                        "Speed",
                                                        type: TextBodyType.m3,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Dimens.marginHorizontalMedium(),
                                                Column(
                                                  children: [
                                                    Component.textBody(
                                                      "100/50 TON",
                                                      type: TextBodyType.m3,
                                                    ),
                                                    Dimens.marginVerticalSmall(),
                                                  ],
                                                ),
                                                Dimens.marginHorizontalMedium(),
                                              ],
                                            ),
                                          ),
                                          Dimens.marginVerticalSmall(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: ColorPalette.greyBackground2,
                                              borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  padding: Dimens.padding10,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: ColorPalette.black,
                                                    borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                        Constant.iconPath + "ic_achievement.png",
                                                        height: Dimens.iconSizeSmall20,
                                                      ),
                                                      Dimens.marginVerticalSmall(),
                                                      Component.textBody(
                                                        "Achievement",
                                                        type: TextBodyType.m3,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Dimens.marginHorizontalMedium(),
                                                Column(
                                                  children: [
                                                    Component.textBody(
                                                      "100/50 TON",
                                                      type: TextBodyType.m3,
                                                    ),
                                                    Dimens.marginVerticalSmall(),
                                                  ],
                                                ),
                                                Dimens.marginHorizontalMedium(),
                                              ],
                                            ),
                                          ),
                                          Dimens.marginVerticalSmall(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: ColorPalette.greyBackground2,
                                              borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  padding: Dimens.padding10,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: ColorPalette.black,
                                                    borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                        Constant.iconPath + "ic_material.png",
                                                        height: Dimens.iconSizeSmall20,
                                                      ),
                                                      Dimens.marginVerticalSmall(),
                                                      Component.textBody(
                                                        "Materials",
                                                        type: TextBodyType.m3,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Dimens.marginHorizontalMedium(),
                                                Component.textTitle(
                                                  "COALS",
                                                  type: TextTitleType.l2,
                                                ),
                                                Dimens.marginHorizontalMedium(),
                                              ],
                                            ),
                                          ),
                                          Dimens.marginVerticalSmall(),
                                          // Container(
                                          //   padding: Dimens.padding10,
                                          //   decoration: BoxDecoration(
                                          //     color: ColorPalette.greyBackground2,
                                          //     borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
                                          //   ),
                                          //   child: Column(
                                          //     mainAxisSize: MainAxisSize.min,
                                          //     children: [
                                          //       Component.textTitle(
                                          //         "HAULING",
                                          //         type: TextTitleType.l2,
                                          //       ),
                                          //       Dimens.marginVerticalSmall(),
                                          //       Row(
                                          //         children: [
                                          //           Icon(
                                          //             Icons.timer,
                                          //             color: ColorPalette.white,
                                          //           ),
                                          //           Dimens.marginHorizontalMedium(),
                                          //           Component.textBody(
                                          //             "02:00",
                                          //             type: TextBodyType.m3,
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: Dimens.padding10,
                                        decoration: BoxDecoration(
                                          color: ColorPalette.black,
                                          borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Component.textBody(
                                              "DSP-2",
                                              type: TextBodyType.m3,
                                              bold: true,
                                            ),
                                            Dimens.marginHorizontalMedium(),
                                            Image.asset(
                                              Constant.iconPath + "ic_navigation.png",
                                              height: Dimens.iconSizeSmall20,
                                            ),
                                            Dimens.marginHorizontalMedium(),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.timer,
                                                      color: ColorPalette.white,
                                                    ),
                                                    Dimens.marginHorizontalMedium(),
                                                    Component.textBody(
                                                      "14m 42s",
                                                      type: TextBodyType.m3,
                                                      bold: true,
                                                    ),
                                                  ],
                                                ),
                                                Component.textBody(
                                                  "1km To go",
                                                  type: TextBodyType.m3,
                                                  bold: true,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      AnimatedCrossFade(
                                        firstChild: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              width: SizeConfig.blockSizeHorizontal * 15,
                                              padding: Dimens.padding10,
                                              decoration: BoxDecoration(
                                                color: ColorPalette.orange,
                                                borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
                                              ),
                                              child: Component.textTitle(
                                                "End Activity",
                                                colors: ColorPalette.white,
                                              ),
                                            ),
                                            Dimens.marginVerticalMedium(),
                                            InkWell(
                                              onTap: controller.onClickAvticity,
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: SizeConfig.blockSizeHorizontal * 15,
                                                padding: Dimens.padding10,
                                                decoration: BoxDecoration(
                                                  color: ColorPalette.black,
                                                  borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
                                                ),
                                                child: Component.textTitle(
                                                  "Activity",
                                                  colors: ColorPalette.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        secondChild: Container(
                                          width: SizeConfig.blockSizeHorizontal * 30,
                                          color: ColorPalette.black.withAlpha(100),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: controller.onBackActivity,
                                                child: Container(
                                                  width: double.infinity,
                                                  alignment: Alignment.center,
                                                  padding: Dimens.padding10,
                                                  decoration: BoxDecoration(
                                                    color: ColorPalette.black,
                                                    borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.arrow_back,
                                                        color: ColorPalette.white,
                                                        size: Dimens.iconSizeMedium,
                                                      ),
                                                      Dimens.marginHorizontalSmall(),
                                                      Component.textTitle(
                                                        "Chose Activity",
                                                        colors: ColorPalette.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Dimens.marginVerticalMedium(),
                                              ...List.generate(controller.listActivityMenu.length, (int index) {
                                                return Container(
                                                  padding: Dimens.padding10,
                                                  child: Component.textBody(
                                                    controller.listActivityMenu[index],
                                                    type: TextBodyType.m3,
                                                  ),
                                                );
                                              })
                                            ],
                                          ),
                                        ),
                                        crossFadeState: controller.isShowActivity ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                        duration: Constant.durationAnimationContainer,
                                      )
                                    ],
                                  ),
                                ),
                              MenuKey.message => Container(
                                  padding: Dimens.padding10,
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: ColorPalette.blackBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            Constant.iconPath + "ic_message.png",
                                            height: Dimens.iconSizeSmall,
                                          ),
                                          Dimens.marginHorizontalMedium(),
                                          Component.textBody(
                                            "Message",
                                            type: TextBodyType.m3,
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () => controller.onClickMenu(MenuKey.home),
                                            child: Container(
                                              padding: Dimens.padding10,
                                              color: ColorPalette.black,
                                              child: Component.textBody(
                                                "Back",
                                                type: TextBodyType.m3,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Dimens.marginVerticalLarge(),
                                      Expanded(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          controller: controller.scrollController,
                                          itemCount: controller.listMessage.length,
                                          itemBuilder: (context, index) {
                                            if (controller.listMessage[index].senderNik == state?.nik) {
                                              return Align(
                                                alignment: Alignment.centerRight,
                                                child: Container(
                                                  margin: const EdgeInsets.only(bottom: 5),
                                                  padding: Dimens.padding10,
                                                  decoration: BoxDecoration(color: ColorPalette.primary, borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall)),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Icon(
                                                            Icons.warning,
                                                            color: ColorPalette.white,
                                                            size: Dimens.iconSizeSmall,
                                                          ),
                                                          Dimens.marginHorizontalMedium(),
                                                          Component.textBody(
                                                            "${controller.listMessage[index].senderName} (${controller.listMessage[index].senderNik})",
                                                            type: TextBodyType.m3,
                                                            bold: true,
                                                          )
                                                        ],
                                                      ),
                                                      Dimens.marginVerticalMedium(),
                                                      Component.textBody(
                                                        controller.listMessage[index].message,
                                                        type: TextBodyType.m3,
                                                      ),
                                                      Dimens.marginVerticalLarge(),
                                                      Component.textBody(
                                                        DataUsecase.dateTimeWithName(controller.listMessage[index].createdAt),
                                                        type: TextBodyType.xs2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  padding: Dimens.padding10,
                                                  margin: const EdgeInsets.only(bottom: 5),
                                                  decoration: BoxDecoration(color: ColorPalette.yellow, borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall)),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Icon(
                                                            Icons.warning,
                                                            color: ColorPalette.white,
                                                            size: Dimens.iconSizeSmall,
                                                          ),
                                                          Dimens.marginHorizontalMedium(),
                                                          Component.textBody(
                                                            "${controller.listMessage[index].senderName} (${controller.listMessage[index].senderNik})",
                                                            type: TextBodyType.m3,
                                                            bold: true,
                                                          )
                                                        ],
                                                      ),
                                                      Dimens.marginVerticalMedium(),
                                                      Component.textBody(
                                                        controller.listMessage[index].message,
                                                        type: TextBodyType.m3,
                                                      ),
                                                      Dimens.marginVerticalLarge(),
                                                      Component.textBody(
                                                        DataUsecase.dateTimeWithName(controller.listMessage[index].createdAt),
                                                        type: TextBodyType.xs2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      Dimens.marginVerticalMedium(),
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(right: 10),
                                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimens.radiusLarge),
                                              color: ColorPalette.white,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Component.textBody(
                                                  "Search",
                                                  type: TextBodyType.m1,
                                                ),
                                                Dimens.marginHorizontalSmall(),
                                                Icon(
                                                  Icons.search,
                                                  color: ColorPalette.greyBackground2,
                                                  size: Dimens.iconSizeSmall,
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              height: 30,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: controller.listChatSuggest.length,
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () => controller.onClickSuggestChat(index),
                                                    child: Container(
                                                      margin: const EdgeInsets.only(right: 10),
                                                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(Dimens.radiusLarge),
                                                        color: ColorPalette.primary,
                                                      ),
                                                      child: Component.textBody(
                                                        controller.listChatSuggest[index].name,
                                                        type: TextBodyType.m3,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Dimens.marginVerticalMedium(),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: controller.message,
                                              decoration: Component.textFieldDecorationWhite("message"),
                                            ),
                                          ),
                                          Dimens.marginHorizontalMedium(),
                                          InkWell(
                                            onTap: controller.onSendCustomMessage,
                                            child: Container(
                                              margin: const EdgeInsets.only(right: 10),
                                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimens.radiusLarge),
                                                color: ColorPalette.primary,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Component.textBody(
                                                    "Send",
                                                    type: TextBodyType.m3,
                                                  ),
                                                  Dimens.marginHorizontalSmall(),
                                                  Icon(
                                                    Icons.send,
                                                    color: ColorPalette.white,
                                                    size: Dimens.iconSizeSmall20,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              MenuKey.setting => Container(),
                              MenuKey.chart => Container(),
                            },
                          ),
                          Container(
                            color: ColorPalette.greyBackground2,
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                            child: Row(
                              children: [
                                Container(
                                  padding: Dimens.padding10,
                                  color: ColorPalette.red,
                                  child: Component.textTitle(
                                    "EMERGENCY",
                                    colors: ColorPalette.white,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: Dimens.padding10,
                                  color: ColorPalette.red,
                                  child: Component.textTitle(
                                    "BREAKDOWN",
                                    colors: ColorPalette.white,
                                  ),
                                ),
                                const Spacer(),
                                Dimens.marginHorizontalMedium(),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                    controller.listMenu.length,
                                    (int index) {
                                      return InkWell(
                                        onTap: () => controller.onClickMenu(controller.listMenu[index].homeKey),
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          margin: const EdgeInsets.only(right: 10),
                                          color: controller.selectedMenuKey == controller.listMenu[index].homeKey ? ColorPalette.primary : null,
                                          child: Image.asset(
                                            Constant.iconPath + controller.listMenu[index].iconPath,
                                            height: Dimens.iconSizeSmall20,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: Dimens.padding10,
                            color: ColorPalette.black,
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Component.textBody(
                                  "CONNEX Node",
                                  colors: ColorPalette.white,
                                ),
                                Dimens.marginHorizontalSmall(),
                                Component.textBody(
                                  "981264214986315989",
                                  colors: ColorPalette.orange,
                                ),
                                Dimens.marginHorizontalLarge(),
                                Component.textBody(
                                  "PING",
                                  colors: ColorPalette.white,
                                ),
                                Dimens.marginHorizontalSmall(),
                                Component.textBody(
                                  "15",
                                  colors: ColorPalette.orange,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: AnimatedCrossFade(
                        firstChild: Container(
                          padding: Dimens.padding10,
                          width: SizeConfig.blockSizeHorizontal * 80,
                          height: SizeConfig.blockSizeVertical * 80,
                          decoration: BoxDecoration(
                            color: ColorPalette.blackBackground,
                            borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    Constant.iconPath + "ic_message.png",
                                    height: Dimens.iconSizeSmall,
                                  ),
                                  Dimens.marginHorizontalMedium(),
                                  Component.textBody(
                                    "Message",
                                    type: TextBodyType.m3,
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: controller.onCloseMessagePopup,
                                    child: Container(
                                      padding: Dimens.padding10,
                                      color: ColorPalette.black,
                                      child: Component.textBody(
                                        "Back",
                                        type: TextBodyType.m3,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Dimens.marginVerticalXXLarge(),
                              Container(
                                width: double.infinity,
                                padding: Dimens.padding20,
                                decoration: BoxDecoration(color: ColorPalette.yellow, borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.warning,
                                          color: ColorPalette.white,
                                          size: Dimens.iconSizeSmall,
                                        ),
                                        Dimens.marginHorizontalMedium(),
                                        Component.textBody(
                                          "${controller.messageNotification?.senderName} (${controller.messageNotification?.senderNik})",
                                          type: TextBodyType.m3,
                                          bold: true,
                                        )
                                      ],
                                    ),
                                    Dimens.marginVerticalMedium(),
                                    Component.textBody(
                                      controller.messageNotification?.message,
                                      type: TextBodyType.m3,
                                    ),
                                    Dimens.marginVerticalLarge(),
                                    Component.textBody(
                                      DataUsecase.dateTimeWithName(controller.messageNotification?.createdAt),
                                      type: TextBodyType.xs2,
                                    ),
                                    Dimens.marginVerticalLarge(),
                                    SwipeButton.expand(
                                      height: SizeConfig.blockSizeVertical * 10,
                                      thumb: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                        size: Dimens.iconSizeSmall,
                                      ),
                                      activeThumbColor: ColorPalette.greyBorder,
                                      activeTrackColor: ColorPalette.greyText,
                                      onSwipe: () => controller.onClickMenu(MenuKey.message),
                                      child: Component.textTitle(
                                        "Balas",
                                        type: TextTitleType.m3,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        secondChild: Container(),
                        crossFadeState: controller.isShowMessagePopup ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: Constant.durationAnimationContainer,
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
