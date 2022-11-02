/* import 'package:shared_preferences/shared_preferences.dart';

abstract class SessionDataProviderKeys {
  static const _apikey = 'api_key';
}

class SessionDataProvider {
  final _sharedPreferences = SharedPreferences.getInstance();

  Future<String?> apiKey() async {
    return (await _sharedPreferences)
        .getString(SessionDataProviderKeys._apikey);
  }

  Future<void> saveApiKey(String key) async {
    (await _sharedPreferences).setString(SessionDataProviderKeys._apikey, key);
  }

  Future<void> clearApiKey() async {
    (await _sharedPreferences).remove(SessionDataProviderKeys._apikey);
  }
}
 */
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const sessionId = 'sessionId';
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getSessionId() => _secureStorage.read(key: _Keys.sessionId);
  Future<void> setSessionId(String value) =>
      _secureStorage.write(key: _Keys.sessionId, value: value);
}
