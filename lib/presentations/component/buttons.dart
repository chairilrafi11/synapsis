import 'package:synapsis/presentations/component/component.dart';
import 'package:flutter/material.dart';

class Buttons {
  static Widget primaryButton({
    required String title,
    required VoidCallback onPressed,
    double? width,
    double? height,
    IconData? iconData,
    bool fitWidth = false,
    Color? color = ColorPalette.primary,
    ButtonType type = ButtonType.primary,
  }) {
    var tempColor = color;
    switch (type) {
      case ButtonType.success:
        tempColor = ColorPalette.primary;
        break;
      case ButtonType.edit:
        tempColor = ColorPalette.blueLight;
        break;
      case ButtonType.cancel:
        tempColor = ColorPalette.red;
        break;
      case ButtonType.secondary:
        tempColor = ColorPalette.accent;
        break;
      case ButtonType.outlineSuccess:
        tempColor = ColorPalette.white;
        break;
      case ButtonType.disabled:
        tempColor = ColorPalette.grey;
        break;
      default:
    }
    var button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: tempColor,
        shape: Component.shape(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconData != null)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Component.icon(iconData),
            ),
          Component.textBody(title, colors: ColorPalette.white),
        ],
      ),
    );

    if (fitWidth) {
      return Container(
        width: fitWidth ? double.infinity : null,
        child: button,
      );
    } else {
      return button;
    }
  }

  static Widget outlineButton({
    required String title,
    required VoidCallback onPressed,
    double? width,
    double? height,
    IconData? iconData,
    bool fitWidth = false,
    Color color = ColorPalette.primary,
    ButtonType type = ButtonType.primary,
  }) {
    var tempColor = color;
    switch (type) {
      case ButtonType.success:
        tempColor = ColorPalette.primary;
        break;
      case ButtonType.edit:
        tempColor = ColorPalette.blueLight;
        break;
      case ButtonType.cancel:
        tempColor = ColorPalette.red;
        break;
      case ButtonType.secondary:
        tempColor = ColorPalette.accent;
        break;
      case ButtonType.outlineSuccess:
        tempColor = ColorPalette.white;
        break;
      default:
    }
    var button = OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: ColorPalette.white,
        shape: Component.shape(),
        side: BorderSide(width: 1.0, color: tempColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconData != null)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Component.icon(iconData),
            ),
          Component.textBody(title, colors: tempColor),
        ],
      ),
    );

    if (fitWidth) {
      return Container(
        width: fitWidth ? double.infinity : null,
        child: button,
      );
    } else {
      return button;
    }
  }
}
