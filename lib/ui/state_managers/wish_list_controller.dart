import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/services/network_caller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/auth_controller.dart';

class WishListController extends GetxController {
  bool _addNewItemInProgress = false;

  bool get addNewItemInProgress => _addNewItemInProgress;

  Future<bool> addToWishlist(int productId) async {
    _addNewItemInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/CreateWishList/$productId');
    _addNewItemInProgress = false;
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