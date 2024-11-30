import 'dart:io';

import 'package:get_dev_flutter_task/config/pref_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static final AuthService _manager = AuthService._();

  late final FlutterSecureStorage _storage;

  static AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  factory AuthService() => _manager;

  AuthService._() {
    if (Platform.isAndroid) {
      _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    } else {
      _storage = const FlutterSecureStorage();
    }
  }

  Future<bool> isAuthenticated() async {
    return await _manager._storage.read(key: PrefKeys.token) != null;
  }
}
