import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageImpl {
  Future<void> write(String key, String value);
  Future<String?> read(String key);
  Future<void> delete(String key);
}

class SecureStorage extends SecureStorageImpl {
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  @override
  Future<void> write(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> read(String key) async {
    return await _flutterSecureStorage.read(key: key);
  }

  @override
  Future<void> delete(String key) async {
    await _flutterSecureStorage.delete(key: key);
  }
}
