import 'package:synapsis/domain/base/repository.dart';
import 'package:synapsis/presentations/dashboard/model/message.dart';
import 'package:synapsis/presentations/dashboard/model/send_message_body.dart';
import 'package:synapsis/presentations/dashboard/model/template_message.dart';

class DashboardRepository extends Repository {
  Future<List<TemplateMessage>> templateMessage() async {
    return await dioService.get(url: Endpoint.templateMessage).then((value) {
      return (value.data as List).map((e) => TemplateMessage.fromJson(e)).toList();
    });
  }

  Future<List<Message>> messages() async {
    return await dioService.get(url: Endpoint.messages, body: {
      'sort': 'created_at,asc',
      'limit': '100',
      'equipment_id': '691b207886',
    }).then((value) {
      return (value.data as List).map((e) => Message.fromJson(e)).toList();
    });
  }

  Future<bool> sendMessage(SendMessageBody sendMessageBody) async {
    return await dioService.post(url: Endpoint.messages, body: sendMessageBody.toJson()).then((value) {
      return validateCodeResponse(value.code);
    });
  }
}
