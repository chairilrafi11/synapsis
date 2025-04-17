import 'package:flutter/material.dart';

class Dimens {
  static const double value2 = 2;
  static const double value4 = 4;
  static const double value6 = 6;
  static const double value8 = 8;
  static const double value10 = 10;
  static const double value12 = 12;
  static const double value14 = 14;
  static const double value16 = 16;
  static const double value18 = 18;
  static const double value20 = 20;
  static const double value22 = 22;
  static const double value24 = 24;
  static const double value26 = 26;
  static const double value28 = 28;
  static const double value30 = 30;
  static const double value32 = 32;
  static const double value34 = 34;
  static const double value36 = 36;
  static const double value38 = 38;
  static const double value40 = 40;
  static const double value42 = 42;
  static const double value44 = 44;
  static const double value46 = 46;
  static const double value48 = 48;
  static const double value50 = 50;
  static const double value52 = 52;
  static const double value56 = 56;
  static const double value58 = 58;
  static const double value60 = 60;
  static const double value65 = 65;
  static const double value70 = 70;
  static const double value80 = 80;
  static const double value100 = 100;
  static const double value120 = 120;

  static const padding10 = EdgeInsets.symmetric(vertical: 10, horizontal: 15);
  static const padding20 = EdgeInsets.symmetric(vertical: 20, horizontal: 20);

  static const paddingContentS = EdgeInsets.symmetric(vertical: 4, horizontal: 15);
  static const paddingContentExtraSmall2 = EdgeInsets.symmetric(vertical: 2, horizontal: 2);
  static const paddingContentExtraSmall = EdgeInsets.symmetric(vertical: 4, horizontal: 6);
  static const paddingContentSmall1 = EdgeInsets.symmetric(vertical: 8, horizontal: 12);
  static const paddingContentM = EdgeInsets.symmetric(vertical: 8, horizontal: 12);
  static const paddingContetDialog = EdgeInsets.symmetric(vertical: 20, horizontal: 20);
  static const paddingPage = EdgeInsets.symmetric(vertical: 10, horizontal: 20);

  static const radiusExtraSmall = 4.0;
  static const radiusSmall6 = 6.0;
  static const radiusSmall = 10.0;
  static const radiusMedium = 15.0;
  static const radiusLarge = 20.0;

  static marginSmall() => const SizedBox(height: 5);
  static marginSmall7() => const SizedBox(height: 7);
  static marginMedium() => const SizedBox(height: 10);
  static marginMedium12() => const SizedBox(height: 12);
  static marginLarge() => const SizedBox(height: 15);

  //* Vertical
  static marginVerticalXSmall() => const SizedBox(height: 3);
  static marginVerticalSmall() => const SizedBox(height: 5);
  static marginVerticalMedium() => const SizedBox(height: 10);
  static marginVerticalLarge() => const SizedBox(height: 15);
  static marginVerticalXLarge() => const SizedBox(height: 25);
  static marginVerticalXXLarge() => const SizedBox(height: 40);
  static marginVerticalXXXLarge() => const SizedBox(height: 70);

  //* Horizontal
  static marginHorizontalXSmall() => const SizedBox(width: 3);
  static marginHorizontalSmall() => const SizedBox(width: 5);
  static marginHorizontalMedium() => const SizedBox(width: 10);
  static marginHorizontalLarge() => const SizedBox(width: 15);
  static marginHorizontalXLarge() => const SizedBox(width: 25);
  static marginHorizontalXXLarge() => const SizedBox(width: 40);
  static marginHorizontalXXXLarge() => const SizedBox(width: 70);

  static const double imageSizeSmall25 = 25;
  static const double imageSizeSmall40 = 40;
  static const double imageSizeSmall = 60;
  static const double imageSizelarge = 100;
  static const double imageSizelarge120 = 120;

  //* Icons Size
  static const double iconSizeSmall = 15;
  static const double iconSizeSmall20 = 20;
  static const double iconSizeMedium = 30;
  static const double iconSizeLarge = 40;

  static marginCard(bool last, {double horizontal = 10}) => EdgeInsets.only(top: 5, bottom: last ? 50 : 5, left: horizontal, right: horizontal);

  //* Map Size
  static const double mapSizeSmall = 250;
  static const double mapUserMarkerSize = 70;

  //* Menu Size
  static const double menuSize = 100;
}
