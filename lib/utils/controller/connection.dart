import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../infrastructure/constant/server.dart';

class ConnectionController extends GetxController {
  final internetConnectionChecker = InternetConnection.createInstance(
    checkInterval: const Duration(seconds: 60),
    useDefaultOptions: false,
    customCheckOptions: [
      InternetCheckOption(
        timeout: const Duration(seconds: 10),
        uri: Uri.parse("${Assets.dev_server_url}:8273/api/check/"),
        responseStatusFn: (response) {
          print("response to internet connection ${response.statusCode}");
          return response.statusCode >= 200 && response.statusCode < 500;
        },
      ),
    ],
  );

  Future<RxBool> hasInternetAccess() async {
    RxBool result = (await internetConnectionChecker.hasInternetAccess).obs;
    return result;
  }

}
