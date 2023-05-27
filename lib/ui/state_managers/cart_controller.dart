import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/services/network_caller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/auth_controller.dart';

class CartController extends GetxController {
  bool _addToCartInProgress = false;

  bool get addToCartInProgress => _addToCartInProgress;

  Future<bool> addToCart(int productId, String size, String color) async {
    _addToCartInProgress = true;
    update();
    final response = await NetworkCaller.postRequest(url: '/CreateCartList', body: {
      "product_id" : productId,
      "color" : color,
      "size" : size
    });
    _addToCartInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      if (response.statusCode == 401) {
        Get.find<AuthController>().logOut();
      }
      update();
      return false;
    }
  }
}