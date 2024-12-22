import 'dart:async';
import 'package:encrypt_shared_preferences/provider.dart';

import '../../infrastructure/dal/dtos/user_dto.dart';

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

  Future<bool> removeToken() async{
    bool token = await _storage.remove('user_token');
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

  Future<bool> setToken(user) async{
    bool isOk = await _storage.setString('user_token', user);
    return isOk;
  }

  Future<bool> setId(id) async{

    bool isOk = await _storage.setString('id_user', id.toString());
    return isOk;
  }

  Future<bool> setEmail(email) async{
    bool isOk = await _storage.setString('email_user', email);
    return isOk;
  }

  Future<String?> getId() async{
    String? isOk = await _storage.getString('id_user');
    return isOk??'';
  }

  Future<String?> getEmail(email) async{
    String? isOk = await _storage.getString('email_user');
    return isOk;
  }

  Future<void> setRecent(Map<String, dynamic> map) async{
    await _storage.setMap(map);
  }


}