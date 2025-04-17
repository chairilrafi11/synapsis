import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis/core/util/size_config.dart';
import 'package:synapsis/presentations/component/component.dart';

class ComponentBottomsheet {
  noConnection() {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/no_connection.jpg",
              width: SizeConfig.blockSizeHorizontal * 80,
            ),
            Component.textTitle("Tidak Ada Koneksi"),
            const SizedBox(
              height: 10,
            ),
            Component.textBody(
              "Aplikasi tidak dapat terhubung, pastikan anda memiliki koneksi internet harap cek kembali data seluler atau wifi",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Component.buttonClose(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      isScrollControlled: true,
      backgroundColor: ColorPalette.white,
    );
  }
}
