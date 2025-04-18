import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:synapsis/core/service/database_service.dart';
import 'package:synapsis/core/service/dio_service.dart';
import 'package:synapsis/core/service/env_service.dart';
import 'package:synapsis/presentations/installation/repository/installation_repository.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('REST API Integration Test', () {
    setUpAll(() async {
      await Get.putAsync<EnvService>(() => EnvService().init(), permanent: true);
      await Get.putAsync<DatabaseService>(() => DatabaseService().init(), permanent: true);
      await Get.putAsync<DioService>(() => DioService().init(), permanent: true);
    });

    testWidgets('Check Service API - Registered Device By ID', (tester) async {
      final InstallationRepository installationRepository = InstallationRepository();

      var deviceById = await installationRepository.checkDeviceById('TEST-chairil123');

      expect(deviceById?.id,  isNotNull);
    });
    testWidgets('Check Service API - Not Registered Device By ID', (tester) async {
      final InstallationRepository installationRepository = InstallationRepository();

      var deviceById = await installationRepository.checkDeviceById("xxxxxxxxxx");

      expect(deviceById, isNull);
    });
  });
}
