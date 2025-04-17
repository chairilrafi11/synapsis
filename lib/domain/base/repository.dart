import 'package:synapsis/core/service/dio_service.dart';
import 'package:get/get.dart';

import '../../core/service/database_service.dart';
export 'dart:convert';
export 'package:synapsis/core/service/dio_service.dart';
export 'package:synapsis/core/app/endpoint.dart';

class Repository {
  final databaseService = Get.find<DatabaseService>();
  final dioService = Get.find<DioService>();

  bool validateCodeResponse(int? code) {
    if (code != null) {
      if (code >= 200 && code <= 299) {
        return true;
      }
    }
    return false;
  }

  int getCodeResponse400(String? error) {
    if (error != null) {
      if (error.toLowerCase().contains('400')) {
        return 400;
      } else {
        return 500;
      }
    }
    return 500;
  }
}
