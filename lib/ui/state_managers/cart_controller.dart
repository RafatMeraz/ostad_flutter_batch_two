import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/models/cart_list_model.dart';
import 'package:ostad_flutter_batch_two/data/services/network_caller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/auth_controller.dart';

class CartController extends GetxController {
  bool _addToCartInProgress = false, _getCartListInProgress = false;
  CartListModel _cartListModel = CartListModel();
  double _totalPrice = 0;

  bool get addToCartInProgress => _addToCartInProgress;

  bool get getCartListInProgress => _getCartListInProgress;

  CartListModel get cartListModel => _cartListModel;

  double get totalPrice => _totalPrice;

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

  Future<bool> getCartList() async {
    _getCartListInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/CartList');
    _getCartListInProgress = false;
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.returnData);
      updateTotalPrice();
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  void incrementItem(int cartItemId) {
    _cartListModel.data!
        .firstWhere((element) => element.id == cartItemId)
        .count++;
    updateTotalPrice();
  }

  void decrementItem(int cartItemId) {
    _cartListModel.data!
        .firstWhere((element) => element.id == cartItemId)
        .count--;
    updateTotalPrice();
  }

  void updateTotalPrice() {
    _totalPrice = 0;
    for (var cart in _cartListModel.data!) {
      _totalPrice +=
          (double.tryParse(cart.product?.price ?? '0') ?? 0) * cart.count;
    }
    update();
  }
}