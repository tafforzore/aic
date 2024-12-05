


import 'dart:io';

import 'package:get/get.dart';

import '../../datas/local_storage/encrypted_storage.dart';
import '../../infrastructure/dal/enum/auth_enum.dart';
import '../../infrastructure/dal/payload/request/login_request.dart';
import '../../infrastructure/dal/payload/request/register_request.dart';
import '../../infrastructure/network/dio_client.dart';

class AuthRepository{
  final DioClient dioClient;
  AuthRepository(this.dioClient);


  Future<LoginVerification> register(RegisterRequest registerRequest) async {
      print(dioClient.dio.options.baseUrl);
      final response = await dioClient.dio.post('/account/register/', data: registerRequest.toMap());
      print("register ${response.data}");
      if (response.statusCode == HttpStatus.ok) {
        // User user = User.fromJson(response.data);
        // Get.put(user, permanent: true);

        final token = response.data['access'];
        final refreshToken = response.data['refresh'];
        Get.find<EncryptedStorage>().setRefreshToken(refreshToken);
        Get.find<EncryptedStorage>().setToken(token);

        Get.find<EncryptedStorage>().setRefreshToken(refreshToken);
        Get.find<EncryptedStorage>().setToken(token);
        return LoginVerification.CREATED;
      } else if(response.statusCode == HttpStatus.badRequest){
        return LoginVerification.WRONG_DATA;
      } else if(response.statusCode == HttpStatus.unauthorized){
        return LoginVerification.USER_EXIST;
      }else{
        return LoginVerification.API_ERROR;
      }
  }
  Future<LoginVerification> login(LoginRequest registerObject) async {
      final response = await dioClient.dio.post('/account/login', data: registerObject.toMap());
      print("login ${response.data}");
      if (response.statusCode == HttpStatus.ok) {

        final token = response.data['access'];
        final refreshToken = response.data['refresh'];
        
        Get.find<EncryptedStorage>().setRefreshToken(refreshToken);
        Get.find<EncryptedStorage>().setToken(token);
        return LoginVerification.CREATED;
      } else if(response.statusCode == HttpStatus.badRequest){
        return LoginVerification.WRONG_DATA;
      } else if(response.statusCode == HttpStatus.unauthorized){
        return LoginVerification.USER_EXIST;
      }else{
        return LoginVerification.API_ERROR;
      }
  }
}
