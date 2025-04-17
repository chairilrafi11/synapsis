import 'package:synapsis/core/app/app_config.dart';
import 'package:intl/intl.dart';

class DataUsecase {
  static String dateNow() {
    return DateFormat.yMMMMEEEEd(AppConfig.dateLocale).format(DateTime.now());
  }

  static String dateWithName(String? value) {
    if (value == null) {
      return '-';
    }
    return DateFormat.yMMMMEEEEd(AppConfig.dateLocale).format(DateTime.parse(value));
  }

  static String dateTimeWithName(String? value) {
    String? data = value;
    if (value == null) {
      return '-';
    }
    if (value.contains('+07:00') || value.contains('+08:00') || value.contains('+09:00')) {
      data = value.replaceAll('+07:00', '').replaceAll('+08:00', '').replaceAll('+09:00', '');
    }
    return DateFormat.yMMMMEEEEd(AppConfig.dateLocale).add_Hm().format(DateTime.parse(data!));
  }

  static String dateTimeWithNameNoTime(String? value) {
    String? data = value;
    if (value == null) {
      return '-';
    }
    if (value.contains('+07:00') || value.contains('+08:00') || value.contains('+09:00')) {
      data = value.replaceAll('+07:00', '').replaceAll('+08:00', '').replaceAll('+09:00', '');
    }
    return DateFormat.yMMMMEEEEd(AppConfig.dateLocale).format(DateTime.parse(data!));
  }

  static String dateDDMMYY(String? value) {
    return DateFormat.yMd(AppConfig.dateLocale).format(DateTime.parse(value ?? DateTime.now().toString()));
  }

  static String? dateHm(String? value) {
    String? data = value;
    if (value == null) {
      return '--:--';
    }
    if (value.contains('+07:00')) {
      data = value.replaceAll('+07:00', '').replaceAll('+08:00', '').replaceAll('+09:00', '');
    }
    return DateFormat('HH:mm', AppConfig.dateLocale).format(DateTime.parse(data!));
  }

  static String dateYYMMDD(String? value) {
    return DateFormat('yyyy-MM-dd', AppConfig.dateLocale).format(DateTime.parse(value ?? DateTime.now().toString()));
  }

  static String dateMMYY(String? value) {
    return DateFormat.yMMMM(AppConfig.dateLocale).format(DateTime.parse(value ?? DateTime.now().toString()));
  }

  static String dateMonthName(String? value) {
    return DateFormat.MMMM(AppConfig.dateLocale).format(DateTime.parse(value ?? DateTime.now().toString()));
  }

  static String dateMMMd(String? value) {
    return DateFormat.MMMd(AppConfig.dateLocale).format(DateTime.parse(value ?? DateTime.now().toString()));
  }
}
