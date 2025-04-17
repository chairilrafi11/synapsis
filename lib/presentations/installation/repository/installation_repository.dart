import 'package:synapsis/domain/base/repository.dart';
import 'package:synapsis/presentations/component/component.dart';
import 'package:synapsis/presentations/login/model/device_by_id.dart';

class InstallationRepository extends Repository {
  Future<DeviceById?> checkDeviceById(String deviceId) async {
    return await dioService.get(url: Endpoint.deviceById.replaceAll(Constant.idPath, deviceId)).then((value) {
      if (validateCodeResponse(value.code)) {
        return DeviceById.fromJson(value.data);
      } else {
        return null;
      }
    });
  }
}
