import 'package:dio/dio.dart';
import 'package:get/get.dart';
class JwtInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }

  @override
  void onResponse(response, ResponseInterceptorHandler handler) async{
    super.onResponse(response, handler);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print("error ${err.response?.statusCode} ${err.response?.data}");
    return handler.next(err);
  }
}
