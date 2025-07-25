import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppLocalStorage {
  final storage = FlutterSecureStorage();

  Future<bool> setValue(String key, String value) async {
    await storage.write(key: key, value: value);
    return true;
  }

  Future<dynamic> getValue(String key) async {
    return await storage.read(key: key);
  }

  Future<bool> deleteValue(String key) async {
    await storage.delete(key: key);
    return true;
  }
}
