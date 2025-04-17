import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:synapsis/core/app/constant.dart';
import 'package:synapsis/core/app/dimens.dart';
import 'package:synapsis/presentations/component/typhography.dart';

export '../../core/app/color_palette.dart';
import '../../core/app/color_palette.dart';
export '../../core/app/constant.dart';

class Component {
  static ThemeData theme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorPalette.primary,
        foregroundColor: ColorPalette.primary,
        elevation: 0,
        shadowColor: ColorPalette.primary,
        surfaceTintColor: ColorPalette.primary,
        iconTheme: IconThemeData(color: ColorPalette.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
          backgroundColor: WidgetStateProperty.all<Color>(ColorPalette.primary),
          foregroundColor: WidgetStateProperty.all<Color>(ColorPalette.white),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStateProperty.all<Color>(ColorPalette.white),
        ),
      ),
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch().copyWith(primary: ColorPalette.primary, secondary: ColorPalette.secondary.withAlpha(100)).copyWith(
            surface: const Color(0xffF7F7F7),
          ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: ColorPalette.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        modalBackgroundColor: ColorPalette.white,
        modalBarrierColor: ColorPalette.white,
        surfaceTintColor: ColorPalette.white,
      ),
      fontFamily: Constant.interRegular,
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorPalette.white,
        surfaceTintColor: ColorPalette.white,
        shadowColor: ColorPalette.white,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all<Color>(ColorPalette.white),
          surfaceTintColor: WidgetStateProperty.all<Color>(ColorPalette.white),
        ),
      ),
    );
  }

  static SystemUiOverlayStyle statusbar() {
    return SystemUiOverlayStyle(
      statusBarColor: ColorPalette.primaryDark,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: null,
    );
  }

  static AppBar appbar(String title, {Function()? onBack, List<Widget>? actions, TabBar? tabBar, bool? centerTitle}) {
    if (onBack == null) {
      return AppBar(
        automaticallyImplyLeading: true,
        centerTitle: centerTitle,
        backgroundColor: ColorPalette.primary,
        systemOverlayStyle: statusbar(),
        title: Component.textBody(title, colors: ColorPalette.white),
        actions: actions,
        bottom: tabBar,
      );
    } else {
      return AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(onPressed: onBack, icon: const Icon(Icons.arrow_back)),
        backgroundColor: ColorPalette.primary,
        title: Component.textBody(title, colors: ColorPalette.white),
        actions: actions,
      );
    }
  }

  static toast(String? message, {SnackType snackType = SnackType.success}) {
    var backGroudColor = ColorPalette.green;
    var icon = const Icon(Icons.check);
    switch (snackType) {
      case SnackType.success:
        backGroudColor = ColorPalette.green;
        icon = const Icon(
          Icons.check,
          color: ColorPalette.white,
        );
        break;
      case SnackType.info:
        backGroudColor = ColorPalette.blueLight;
        icon = const Icon(
          Icons.info,
          color: ColorPalette.white,
        );
      case SnackType.warning:
        backGroudColor = ColorPalette.yellow;
        icon = const Icon(
          Icons.warning,
          color: ColorPalette.white,
        );
      case SnackType.error:
        backGroudColor = ColorPalette.red;
        icon = const Icon(
          Icons.close,
          color: ColorPalette.white,
        );
    }
    Get.rawSnackbar(
      message: message,
      backgroundColor: backGroudColor,
      icon: icon,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      borderRadius: 12,
    );
  }

  static shadow({Color? color = ColorPalette.white}) => BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
      );

  static TextStyle hintTextStyle() {
    return const TextStyle(
      fontSize: 12.0,
      color: ColorPalette.textGrey,
      fontWeight: FontWeight.w500,
    );
  }

  static textFieldDecorationRegular(
    String hint, {
    IconData? iconSuffix,
    IconData? iconPrefix,
    void Function()? onClickSuffix,
  }) =>
      InputDecoration(
        fillColor: ColorPalette.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)),
          borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)),
          borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
          borderSide: BorderSide(color: ColorPalette.primary.withAlpha(100)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
          borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.radiusExtraSmall),
          borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)),
        ),
        prefixIcon: iconPrefix != null ? Icon(iconPrefix, color: ColorPalette.primary) : null,
        suffixIcon: iconSuffix != null
            ? InkWell(
                onTap: onClickSuffix,
                child: Icon(
                  iconSuffix,
                  color: ColorPalette.primary,
                ),
              )
            : null,
        counterText: "",
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        hintStyle: const TextStyle(
          fontSize: 12.0,
          color: ColorPalette.textGrey,
          fontWeight: FontWeight.w500,
        ),
      );

  static textFieldDecorationGreen(
    String hint, {
    IconData? iconSuffix,
    IconData? iconPrefix,
    void Function()? onClickSuffix,
    double radius = 15,
    bool enable = true,
  }) =>
      InputDecoration(
        fillColor: enable ? ColorPalette.white : ColorPalette.whiteBackground,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.secondary.withAlpha(100)),
          borderRadius: BorderRadius.circular(radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.secondary.withAlpha(100)),
          borderRadius: BorderRadius.circular(radius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: ColorPalette.secondary.withAlpha(100)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: ColorPalette.secondary.withAlpha(100)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: ColorPalette.secondary.withAlpha(100)),
        ),
        prefixIcon: iconPrefix != null
            ? Icon(
                iconPrefix,
                color: ColorPalette.primary,
                size: 20,
              )
            : null,
        suffixIcon: iconSuffix != null
            ? InkWell(
                onTap: onClickSuffix,
                child: Icon(
                  iconSuffix,
                  color: ColorPalette.primary,
                  size: 20,
                ),
              )
            : null,
        counterText: "",
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        hintStyle: hintTextStyle(),
      );

  static textFieldDecorationWhite(
    String hint, {
    IconData? iconSuffix,
    IconData? iconPrefix,
    void Function()? onClickSuffix,
    double radius = 15,
  }) =>
      InputDecoration(
        fillColor: ColorPalette.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.white.withAlpha(100)),
          borderRadius: BorderRadius.circular(radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.white.withAlpha(100)),
          borderRadius: BorderRadius.circular(radius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: ColorPalette.white.withAlpha(100)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: ColorPalette.white.withAlpha(100)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: ColorPalette.white.withAlpha(100)),
        ),
        prefixIcon: iconPrefix != null ? Icon(iconPrefix, color: ColorPalette.primary) : null,
        suffixIcon: iconSuffix != null
            ? InkWell(
                onTap: onClickSuffix,
                child: Icon(
                  iconSuffix,
                  color: ColorPalette.primary,
                  size: 20,
                ),
              )
            : null,
        counterText: "",
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        hintStyle: hintTextStyle(),
      );

  static decorationNoBorderSearch(String hint, {IconData? iconPrefix}) => InputDecoration(
      fillColor: ColorPalette.white,
      filled: true,
      border: OutlineInputBorder(borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)), borderRadius: BorderRadius.circular(5)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)), borderRadius: BorderRadius.circular(5)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(color: ColorPalette.primary.withAlpha(100)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)),
      ),
      prefixIcon: iconPrefix != null
          ? Icon(
              iconPrefix,
              color: ColorPalette.primary,
              size: 20,
            )
          : null,
      counterText: "",
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      hintStyle: const TextStyle(fontSize: 12.0, color: ColorPalette.textGrey, fontWeight: FontWeight.w500));
  static TextStyle textStyle() => const TextStyle(fontSize: 13.0, color: ColorPalette.blackText);

  static Widget textTitle(
    String? text, {
    Color? colors = ColorPalette.blackText,
    TextAlign? textAlign = TextAlign.start,
    TextTitleType type = TextTitleType.m1,
    bool bold = false,
    int? maxLines = 2,
  }) {
    var style = ComponentTyphography.titleSmall()!.copyWith(
      color: colors,
      fontFamily: Constant.interMedium,
    );
    switch (type) {
      case TextTitleType.m1:
        style = ComponentTyphography.titleSmall()!.copyWith(
          color: colors,
          fontFamily: Constant.interMedium,
        );
        break;
      case TextTitleType.m2:
        style = ComponentTyphography.titleSmall()!.copyWith(
          color: ColorPalette.primary,
          fontFamily: Constant.interMedium,
          fontWeight: FontWeight.bold,
        );
      case TextTitleType.m3:
        style = ComponentTyphography.titleSmall()!.copyWith(
          color: ColorPalette.white,
          fontFamily: Constant.interMedium,
          fontWeight: FontWeight.bold,
        );
        break;
      case TextTitleType.l1:
        style = ComponentTyphography.titleSmall()!.copyWith(
          color: colors,
          fontFamily: Constant.interMedium,
        );
        break;
      case TextTitleType.l2:
        style = ComponentTyphography.titleMedium()!.copyWith(
          color: ColorPalette.white,
          fontWeight: FontWeight.bold,
        );
      case TextTitleType.xl1:
        style = ComponentTyphography.titleLarge()!.copyWith(
          color: ColorPalette.blackText,
          fontFamily: Constant.interBold,
          fontWeight: FontWeight.bold,
        );
        break;
      case TextTitleType.xl2:
        style = ComponentTyphography.headlineMedium()!.copyWith(
          color: ColorPalette.white,
          fontFamily: Constant.interBold,
          fontWeight: FontWeight.bold,
        );
        break;
      case TextTitleType.xl3:
        style = ComponentTyphography.headlineMedium()!.copyWith(
          color: ColorPalette.greyText,
          fontFamily: Constant.interBold,
          fontWeight: FontWeight.bold,
        );
        break;
      case TextTitleType.xxl1:
        style = ComponentTyphography.headlineLarge()!.copyWith(
          color: ColorPalette.blackText,
          fontFamily: Constant.interBold,
          fontWeight: FontWeight.bold,
        );
        break;
      case TextTitleType.xxxl1:
        style = ComponentTyphography.displaysmall()!.copyWith(
          color: ColorPalette.blackText,
          fontFamily: Constant.interBold,
          fontWeight: FontWeight.bold,
        );
        break;
      default:
        break;
    }
    if (bold) {
      style = style.copyWith(fontWeight: FontWeight.bold);
    }

    return Text(
      text ?? "",
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }

  static Widget textBody(
    String? text, {
    Color? colors,
    TextAlign? textAlign = TextAlign.start,
    TextBodyType type = TextBodyType.m1,
    bool bold = false,
  }) {
    var style = ComponentTyphography.bodySmall()!.copyWith(
      color: ColorPalette.blackText,
    );
    switch (type) {
      case TextBodyType.xs1:
        style = ComponentTyphography.bodyMini().copyWith(
          color: ColorPalette.textGrey,
        );
      case TextBodyType.xs2:
        style = ComponentTyphography.bodyMini().copyWith(
          color: ColorPalette.white,
        );
      case TextBodyType.xs3:
        style = ComponentTyphography.bodyMini().copyWith(
          color: ColorPalette.blackText,
        );
      case TextBodyType.s1:
        style = ComponentTyphography.bodyExtraSmall().copyWith(
          color: ColorPalette.blackText,
        );
      case TextBodyType.s2:
        style = ComponentTyphography.bodyExtraSmall().copyWith(
          color: ColorPalette.textGrey,
        );
      case TextBodyType.s3:
        style = ComponentTyphography.bodyExtraSmall().copyWith(
          color: ColorPalette.white,
        );
      case TextBodyType.s19:
        style = ComponentTyphography.bodyExtraSmall10().copyWith(
          color: ColorPalette.blackText,
        );
      case TextBodyType.m1:
        style = ComponentTyphography.bodySmall()!.copyWith(
          color: colors,
        );
        break;
      case TextBodyType.m2:
        style = ComponentTyphography.bodySmall()!.copyWith(
          color: ColorPalette.primary,
          fontWeight: FontWeight.bold,
        );
        break;
      case TextBodyType.m3:
        style = ComponentTyphography.bodySmall()!.copyWith(
          color: ColorPalette.white,
        );
        break;
      case TextBodyType.l1:
        style = ComponentTyphography.bodySmall()!.copyWith(
          color: ColorPalette.blackText,
        );
      case TextBodyType.l2:
        style = ComponentTyphography.bodySmall()!.copyWith(
          color: ColorPalette.greyText,
        );
        break;
      default:
        break;
    }
    if (bold) {
      style = style.copyWith(fontWeight: FontWeight.bold);
    }
    if (colors != null) {
      style = style.copyWith(color: colors);
    }
    return Text(
      text ?? "",
      style: style,
      textAlign: textAlign,
    );
  }

  static Widget button(
    String label,
    void Function()? onPressed, {
    Color color = ColorPalette.primary,
    ButtonType type = ButtonType.primary,
    IconData? iconData,
    bool fitWidth = true,
  }) {
    Color colorButton = color;
    switch (type) {
      case ButtonType.primary:
        colorButton = color;
        break;
      case ButtonType.secondary:
        colorButton = ColorPalette.accent;
        break;
      case ButtonType.cancel:
        colorButton = ColorPalette.red;
        break;
      default:
    }
    var child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (iconData != null)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(
              iconData,
              color: ColorPalette.white,
            ),
          ),
        Flexible(
          child: Text(
            label,
            style: ComponentTyphography.bodySmall()!.copyWith(
              color: ColorPalette.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
    if (fitWidth) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: child,
      );
    } else {
      return InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          decoration: BoxDecoration(
            color: colorButton,
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      );
    }
  }

  static RoundedRectangleBorder shape({double radius = Dimens.radiusSmall}) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }

  static icon(IconData icon, {Color color = ColorPalette.white, double? size}) {
    return Icon(icon, color: color, size: size);
  }

  static Widget buttonClose({String? label, Object? result}) => InkWell(
        onTap: () => Get.back(result: result),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: ColorPalette.primary),
          child: Component.textBody(
            label ?? "Mengerti",
            colors: ColorPalette.white,
            textAlign: TextAlign.center,
          ),
        ),
      );
}
