import 'package:synapsis/core/app/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    margin: Dimens.padding20,
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
                        Dimens.marginVerticalXLarge(),
                        Component.button(
                          'Submit',
                          () => controller.onLogin(),
                          fitWidth: true,
                        ),
                      ],
                    ),
                  ),
                );
              },
              onLoading: Container(
                width: double.infinity,
                margin: Dimens.padding20,
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(Dimens.radiusMedium),
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
                    Dimens.marginVerticalLarge(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: ColorPalette.primary,
                          size: Dimens.imageSizelarge,
                        ),
                        Dimens.marginHorizontalLarge(),
                        Column(
                          children: [
                            Component.textTitle(
                              "Ichwan",
                              type: TextTitleType.l1,
                            ),
                            Dimens.marginVerticalMedium(),
                            Component.textTitle(
                              "Operator",
                              type: TextTitleType.l3,
                            ),
                          ],
                        ),
                        Dimens.marginHorizontalLarge(),
                        CircularProgressIndicator(
                          color: ColorPalette.greyText,
                        )
                      ],
                    ),
                    Dimens.marginVerticalLarge(),
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
