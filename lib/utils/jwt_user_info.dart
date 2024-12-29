import 'dart:convert';

import '../datas/user_model.dart';

class DecodeJwt{
  User? decodeJwt(String token) {
    try {
      List<String> parts = token.split('.');

      if (parts.length != 3) {
        throw Exception('Token JWT mal formé');
      }

      String payloadBase64 = parts[1];

      int padding = payloadBase64.length % 4;
      if (padding > 0) {
        payloadBase64 += '=' * (4 - padding);
      }

      String decodedPayload = utf8.decode(base64Url.decode(payloadBase64));

      Map<String, dynamic> decodedMap = jsonDecode(decodedPayload);

      return User.fromMap(decodedMap);
    } catch (e) {
      print('Erreur de décodage du JWT: $e');
      return null;
    }
  }
}

