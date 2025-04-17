class Endpoint {

  //* Device Management
  static const String deviceById = '/equipments/devices/:id';

  //* Template Message
  static const String templateMessage = '/monitoring/subjects';
  static const String messages = '/monitoring/messages';

  //* Auth
  static const String login = 'login-tablet-unit';

  //* Web Socket
  static const String webSocketMessage = '/monitoring/messages/equipments';
}
