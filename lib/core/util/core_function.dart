import 'dart:convert';
import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:synapsis/core/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'debouncer.dart';

class CoreFunction {
  static void logPrint(String? key, dynamic value) {
    debugPrint("$key => ${value.toString()}", wrapWidth: 9999999);
  }

  static final debouncer = Debouncer(milliseconds: 500);

  static Future<bool> checkConnectivity() async {
    bool connect = false;
    try {
      final result = await InternetAddress.lookup('google.com').timeout(const Duration(seconds: 5));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connect = true;
      }
    } on SocketException catch (_) {
      connect = false;
    }
    return connect;
  }

  static Future versionInfo() async {
    final info = await PackageInfo.fromPlatform();
    AuthService().setVersion(info.version);
    AuthService().setBuild(info.buildNumber);
    AuthService().setPackage(info.packageName);
  }

  static String getInitials(String? name) {
    if (name == null) {
      return "-";
    }
    name.trim();
    List<String> words = name.split(' ');

    if (words.isEmpty) {
      return name;
    }

    return words.map((word) => word.isNotEmpty ? word[0].toUpperCase() : "-").join();
  }

  static Map<String, dynamic> listIntToMap(List<int> data) {
    final jsonString = utf8.decode(data);
    final map = jsonDecode(jsonString);
    return map;
  }
}
