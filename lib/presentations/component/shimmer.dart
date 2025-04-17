import 'package:flutter/material.dart';
import 'package:synapsis/core/app/color_palette.dart';
import 'package:synapsis/core/app/constant.dart';
import 'package:synapsis/core/app/dimens.dart';
import 'package:synapsis/core/util/size_config.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget {
  static Widget loadingList() {
    return Shimmer.fromColors(
      period: Duration(milliseconds: Constant.durationShimmer),
      highlightColor: ColorPalette.white,
      baseColor: ColorPalette.shimmer,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 30,
              decoration: BoxDecoration(color: ColorPalette.shimmer, borderRadius: BorderRadius.circular(10)),
              width: SizeConfig.blockSizeHorizontal * 100,
            );
          },
        ),
      ),
    );
  }

  static Widget loadingListWithPhoto() {
    return Shimmer.fromColors(
      period: Duration(milliseconds: Constant.durationShimmer),
      highlightColor: ColorPalette.white,
      baseColor: ColorPalette.shimmer,
      child: Padding(
        padding: Dimens.padding10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            10,
            (index) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 20,
                        width: double.infinity,
                        decoration: BoxDecoration(color: ColorPalette.shimmer, borderRadius: BorderRadius.circular(5)),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 20,
                        width: double.infinity,
                        decoration: BoxDecoration(color: ColorPalette.shimmer, borderRadius: BorderRadius.circular(5)),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 20,
                        width: double.infinity,
                        decoration: BoxDecoration(color: ColorPalette.shimmer, borderRadius: BorderRadius.circular(5)),
                      ),
                    ],
                  ),
                ),
                Dimens.marginHorizontalMedium(),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    height: Dimens.imageSizelarge,
                    width: Dimens.imageSizelarge,
                    decoration: BoxDecoration(color: ColorPalette.shimmer, borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget loadingAttendance() {
    return Shimmer.fromColors(
      period: Duration(milliseconds: Constant.durationShimmer),
      highlightColor: ColorPalette.white,
      baseColor: ColorPalette.shimmer,
      child: Padding(
        padding: Dimens.padding10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(color: ColorPalette.shimmer, borderRadius: BorderRadius.circular(5)),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    height: Dimens.imageSizeSmall40,
                    width: Dimens.imageSizelarge,
                    decoration: BoxDecoration(color: ColorPalette.shimmer, borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Dimens.marginHorizontalMedium(),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    height: Dimens.imageSizeSmall40,
                    width: Dimens.imageSizelarge,
                    decoration: BoxDecoration(color: ColorPalette.shimmer, borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Dimens.marginHorizontalMedium(),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    height: Dimens.imageSizeSmall40,
                    width: Dimens.imageSizelarge,
                    decoration: BoxDecoration(color: ColorPalette.shimmer, borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 40,
              width: SizeConfig.blockSizeHorizontal * 50,
              decoration: BoxDecoration(color: ColorPalette.shimmer, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
    );
  }
}
