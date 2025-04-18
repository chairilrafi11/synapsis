import 'package:flutter/material.dart';
import 'package:synapsis/core/app/database_key.dart';
import 'package:synapsis/presentations/dashboard/view/dashboard_view.dart';
import 'package:get/get.dart';
import 'package:synapsis/core/service/database_service.dart';
import 'package:synapsis/presentations/login/model/auth.dart';
import 'package:synapsis/presentations/login/model/login_body.dart';
import 'package:synapsis/presentations/login/repository/login_repository.dart';

class LoginController extends GetxController with StateMixin<Auth> {
  final formKey = new GlobalKey<FormState>();
  final TextEditingController nik = TextEditingController();
  LoginRepository loginRepository = LoginRepository();
  DatabaseService databaseService = Get.find<DatabaseService>();
  bool isError = false;
  Auth? auth;

  @override
  onReady() {
    change(null, status: RxStatus.success());
    super.onReady();
  }

  Future<void> onLogin() async {
    if (formKey.currentState!.validate()) {
      LoginBody loginRequest = LoginBody(
        nik: nik.text,
        unitId: "691b207886",
        shiftId: "048C-NS",
        loginType: 1,
      );
      await loginRepository.login(loginRequest).then((value) async {
        auth = value;
        update();
        change(null, status: RxStatus.loading());
        await 3.delay();
        databaseService.write(Databasekey.auth, value.toJson());
        Get.offAll(() => DashboardView());
      }).catchError((error) {
        isError = true;
        update();
      });
    }
  }
}
