import 'dart:async';
import 'package:encrypt_shared_preferences/provider.dart';

class EncryptedStorage{
  final EncryptedSharedPreferences _storage;
  EncryptedStorage._(this._storage);
  static Completer<EncryptedStorage>? _completer;

  static Future<EncryptedStorage> init() async {
    if(_completer == null){
      final key = "xxxxxxxxxxxxXXXX";
      await EncryptedSharedPreferences.initialize(key);
      var sharedPref = EncryptedSharedPreferences.getInstance();

      final Completer<EncryptedStorage> completer = Completer<EncryptedStorage>();
      _completer = completer;

      completer.complete(EncryptedStorage._(sharedPref));
    }
    return _completer!.future;
  }

  Future<String> getToken() async{
    String? token = await _storage.getString('user_token')??"";
    return token;
  }
  Future<String> getRefreshToken() async{
    String? refreshToken = await _storage.getString('refresh_token')??"";
    return refreshToken;
  }
  Future<bool> setRefreshToken(refreshToken) async{
    bool isOk = await _storage.setString('refresh_token', refreshToken);
    return isOk;
  }
  Future<bool> setToken(token) async{
    bool isOk = await _storage.setString('user_token', token);
    return isOk;
  }
}