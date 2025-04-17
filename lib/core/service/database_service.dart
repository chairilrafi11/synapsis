import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DatabaseService extends GetxService {
  late GetStorage box;

  Future<DatabaseService> init() async {
    await GetStorage.init();
    box = GetStorage();
    return this;
  }

  Future write(String key, dynamic value) => box.write(key, value);

  Future<dynamic> read(String key) async => await box.read(key);

  void remove(String key) => box.remove(key);

  bool hasData(String key) => box.hasData(key);

  Future clear() async => box.erase();
}
