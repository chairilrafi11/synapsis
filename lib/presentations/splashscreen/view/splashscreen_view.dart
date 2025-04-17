import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:synapsis/core/util/size_config.dart';
import 'package:synapsis/presentations/component/component.dart';
import 'package:synapsis/presentations/splashscreen/controller/splashscreen_controller.dart';

class SplashscreenView extends StatelessWidget {
  SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return GetBuilder<SplashscreenController>(
      init: SplashscreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorPalette.white,
          body: Center(
            child: Image.asset(
              Constant.iconPath + "icon.png",
              width: SizeConfig.blockSizeHorizontal * 90,
            ),
          ),
        );
      },
    );
  }
}
