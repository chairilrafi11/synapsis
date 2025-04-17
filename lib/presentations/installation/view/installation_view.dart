import 'package:synapsis/core/app/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis/core/service/auth_service.dart';
import 'package:synapsis/presentations/component/typhography.dart';
import 'package:synapsis/presentations/installation/controller/installation_controller.dart';

import '../../component/component.dart';

class InstallationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InstallationController>(
      init: InstallationController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorPalette.black,
          body: Container(
            width: double.infinity,
            margin: Dimens.padding20,
            padding: Dimens.padding20,
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(Dimens.radiusMedium),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Constant.iconPath + "ic_installation.png",
                      height: Dimens.iconSizeMedium,
                    ),
                    Dimens.marginHorizontalMedium(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Component.textTitle(
                          "Installation Wizard",
                          type: TextTitleType.xl1,
                        ),
                        Component.textBody(
                          "Device must be registered before can be used",
                          colors: ColorPalette.primary,
                        ),
                      ],
                    ),
                  ],
                ),
                Dimens.marginVerticalXXLarge(),
                controller.obx(
                  (state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Component.textBody(
                          "Your Serial Number",
                        ),
                        Dimens.marginVerticalSmall(),
                        Container(
                          padding: Dimens.padding10,
                          decoration: BoxDecoration(
                            color: ColorPalette.whiteBackground,
                            borderRadius: BorderRadius.all(Radius.circular(Dimens.radiusExtraSmall)),
                            border: Border.all(
                              color: ColorPalette.greyBackground,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            state.toString(),
                            style: ComponentTyphography.titleLarge()!.copyWith(
                              color: ColorPalette.blackText,
                            ),
                          ),
                        ),
                        Dimens.marginVerticalLarge(),
                        Component.textBody(
                          "Waiting for activation",
                          colors: ColorPalette.primary,
                        ),
                      ],
                    );
                  },
                  onLoading: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LinearProgressIndicator(
                        color: ColorPalette.primary,
                        minHeight: Dimens.value10,
                      ),
                      Dimens.marginVerticalXLarge(),
                      Component.textBody(
                        "Please Wait",
                        type: TextBodyType.l1,
                        bold: true,
                      ),
                      Dimens.marginHorizontalMedium(),
                      Component.textBody(
                        "We tried to install your device",
                      ),
                    ],
                  ),
                ),
                Dimens.marginVerticalXXXLarge(),
                Component.textBody(
                  "Version ${AuthService.version}",
                ),
                Dimens.marginVerticalLarge(),
              ],
            ),
          ),
        );
      },
    );
  }
}
