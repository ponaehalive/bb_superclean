import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const sessionId = '';
  static const locale = '';
}

class SecureAuthData {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getSessionId() => _secureStorage.read(key: _Keys.sessionId);

  Future<void> saveSessionId(String? value) {
    if (value != null) {
      return _secureStorage.write(key: _Keys.sessionId, value: value);
    } else {
      return _secureStorage.delete(key: _Keys.sessionId);
    }
  }

  Future<void> saveLocale(String? value) {
    if (value != null) {
      return _secureStorage.write(key: _Keys.locale, value: value);
    } else {
      return _secureStorage.delete(key: _Keys.locale);
    }
  }

  Future<String?> getLocale() => _secureStorage.read(key: _Keys.locale);
}
