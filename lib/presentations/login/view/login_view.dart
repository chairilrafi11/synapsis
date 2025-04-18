import 'package:synapsis/core/app/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:synapsis/core/util/size_config.dart';
import 'package:synapsis/domain/usecase/textfield_validator.dart';
import 'package:synapsis/presentations/login/controller/login_cotroller.dart';

import '../../component/component.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorPalette.black,
          body: Center(
            child: controller.obx(
              (state) {
                return Form(
                  key: controller.formKey,
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 40,
                    margin: Dimens.padding20,
                    padding: Dimens.padding20.copyWith(left: Dimens.value30, right: Dimens.value30),
                    decoration: BoxDecoration(color: ColorPalette.white, borderRadius: BorderRadius.circular(Dimens.radiusMedium)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Component.textTitle(
                          "Login By Code",
                          type: TextTitleType.xl1,
                        ),
                        Dimens.marginVerticalLarge(),
                        Component.textBody(
                          "Enter Your NIK",
                          type: TextBodyType.l2,
                        ),
                        Dimens.marginVerticalXLarge(),
                        TextFormField(
                          controller: controller.nik,
                          keyboardType: TextInputType.text,
                          style: Component.textStyle(),
                          decoration: Component.textFieldDecorationRegular(
                            "Enter NIK",
                          ),
                          validator: TextFieldValidator.regular,
                        ),
                        Dimens.marginVerticalSmall(),
                        if (controller.isError)
                          Component.textBody(
                            "Can't find your NIK",
                            colors: ColorPalette.red,
                          ),
                        Dimens.marginVerticalXLarge(),
                        Container(
                          width: double.infinity,
                          child: Component.button(
                            'Submit',
                            () => controller.onLogin(),
                            fitWidth: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              onLoading: Container(
                width: SizeConfig.blockSizeHorizontal * 40,
                margin: Dimens.padding20,
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: Dimens.padding10,
                      decoration: BoxDecoration(
                        color: ColorPalette.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimens.radiusExtraSmall),
                          topRight: Radius.circular(Dimens.radiusExtraSmall),
                        ),
                      ),
                      child: Component.textTitle(
                        "Welcome Back",
                        type: TextTitleType.xl2,
                      ),
                    ),
                    Dimens.marginVerticalXXLarge(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            controller.auth?.imageUrl ?? "",
                            fit: BoxFit.cover,
                            height: Dimens.imageSizelarge,
                            width: Dimens.imageSizelarge,
                          ),
                        ),
                        Dimens.marginHorizontalLarge(),
                        Column(
                          children: [
                            Component.textTitle(
                              controller.auth?.name,
                              type: TextTitleType.xl1,
                            ),
                            Dimens.marginVerticalMedium(),
                            Component.textTitle(
                              controller.auth?.roleName,
                              type: TextTitleType.l3,
                              colors: ColorPalette.greyText2,
                            ),
                          ],
                        ),
                        Dimens.marginHorizontalLarge(),
                        CircularProgressIndicator(
                          color: ColorPalette.greyText,
                        )
                      ],
                    ),
                    Dimens.marginVerticalXXLarge(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
