import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:get/get.dart';

import '../../datas/local_storage/encrypted_storage.dart';
import '../../datas/user_model.dart';
import '../../infrastructure/dal/enum/auth_enum.dart';
import '../../infrastructure/dal/payload/request/login_request.dart';
import '../../infrastructure/dal/payload/request/register_request.dart';
import '../../infrastructure/network/dio_client.dart';
import '../../utils/jwt_user_info.dart';

class AuthRepository{
  final DioClient dioClient;
  AuthRepository(this.dioClient);


  Future<LoginVerification> register(RegisterRequest registerRequest) async {
      print(dioClient.dio.options.baseUrl);
      final response = await dioClient.dio.post('/account/register/', data: registerRequest.toMap());
      print("register ${response.data}");
      print(" reponse du backend ${response.statusCode}");
      if (response.statusCode == HttpStatus.ok) {

        final token = response.data['access'];
        final refreshToken = response.data['refresh'];
        Get.find<EncryptedStorage>().setRefreshToken(refreshToken);
        Get.find<EncryptedStorage>().setToken(token);
        User? user = DecodeJwt().decodeJwt(token);
        if(user != null){
          Get.find<EncryptedStorage>().setId(user.id);
          Get.find<EncryptedStorage>().setEmail(user.email);
          return LoginVerification.CREATED;
        }
        return LoginVerification.API_ERROR;
      } else if(response.statusCode == HttpStatus.badRequest){
        return LoginVerification.WRONG_DATA;
      } else if(response.statusCode == HttpStatus.unauthorized){
        return LoginVerification.USER_EXIST;
      }else{
        return LoginVerification.API_ERROR;
      }
  }

  Future<LoginVerification> login(LoginRequest registerObject) async {
    try {
      final response = await dioClient.dio.post(
        '/account/login/',
        data: registerObject.toMap(),
      );

      print("Login Response Data: ${response.data}");
      print("Login Response Status Code: ${response.statusCode}");

      if (response.statusCode == HttpStatus.ok) {
        final token = response.data['access'];
        final refreshToken = response.data['refresh'];

        await Get.find<EncryptedStorage>().setRefreshToken(refreshToken);
        await Get.find<EncryptedStorage>().setToken(token);
        User? user = DecodeJwt().decodeJwt(token);
        if(user != null){
          Get.find<EncryptedStorage>().setId(user.id);
          Get.find<EncryptedStorage>().setEmail(user.email);
          return LoginVerification.CREATED;
        }
        return LoginVerification.API_ERROR;

        return LoginVerification.CREATED;
      } else if (response.statusCode == HttpStatus.badRequest) {
        return LoginVerification.WRONG_DATA;
      } else if (response.statusCode == HttpStatus.unauthorized) {
        return LoginVerification.USER_EXIST;
      } else {
        return LoginVerification.API_ERROR;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == HttpStatus.badRequest) {
          return LoginVerification.WRONG_DATA;
        }
      }
      return LoginVerification.API_ERROR;
    } catch (e) {
      print("Unexpected error: $e");
      return LoginVerification.API_ERROR;
    }
  }


}
