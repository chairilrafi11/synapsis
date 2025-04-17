import 'package:synapsis/domain/base/repository.dart';
import 'package:synapsis/presentations/login/model/auth.dart';
import 'package:synapsis/presentations/login/model/login_body.dart';

class LoginRepository extends Repository {
  Future<Auth> login(LoginBody loginBody) async {
    return await dioService.post(url: Endpoint.login, body: loginBody.toJson(),).then((value) {
      return Auth.fromJson(value.data);
    });
  }
}
