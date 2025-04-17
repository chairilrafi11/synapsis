class AuthService {
  static final AuthService _singleton = AuthService._internal();

  factory AuthService() {
    return _singleton;
  }

  AuthService._internal();

  static String _version = "";
  static String _build = "";
  static String _package = "";
  
  static String get version => _version;
  static String get build => _build;
  static String get package => _package;

  setVersion(String value) => _version = value;

  setBuild(String value) => _build = value;

  setPackage(String value) => _package = value;


}
