import 'package:get/get.dart';

import '../../data/auth_utils.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';

class AuthController extends GetxController {
  bool loginInProgress = false;

  Future<bool> login(
    String email,
    String password,
  ) async {
    loginInProgress = true;
    update();
    final result = await NetworkUtils().postMethod(Urls.loginUrl,
        body: {'email': email, 'password': password});
    loginInProgress = false;
    if (result != null && result['status'] == 'success') {
      await AuthUtils.saveUserData(
        result['data']['firstName'],
        result['data']['lastName'],
        result['token'],
        result['data']['photo'],
        result['data']['mobile'],
        result['data']['email'],
      );
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
