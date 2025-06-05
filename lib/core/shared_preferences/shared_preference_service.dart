import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPreferenceService {
  final FlutterSecureStorage _prefs;

  SharedPreferenceService(this._prefs);

  writeValue(String key, String value) async {
    await _prefs.write(key: key, value: value);
  }

  Future<String?> getString(String key) async {
    return await _prefs.read(key: key);
  }

  Future<bool?> getBool(String key) async {
    String? boolValueStr = await _prefs.read(key: key);
    bool? boolValue = boolValueStr != null
        ? boolValueStr.toLowerCase() == 'true'
        : null;
    return boolValue;
  }

  Future<int?> getInt(String key) async {
    String? intValueStr = await _prefs.read(key: key);
    int? intValue = intValueStr != null ? int.parse(intValueStr) : null;
    return intValue;
  }

  Future<double?> getDouble(String key) async {
    String? doubleValueStr = await _prefs.read(key: key);
    double? doubleValue = doubleValueStr != null ? double.parse(doubleValueStr) : null;
    return doubleValue;
  }

  Future remove(String key) async {
    await _prefs.delete(key: key);
  }

  Future deleteAll() async {
    await _prefs.deleteAll();
  }

}
