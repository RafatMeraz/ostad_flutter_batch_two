import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/models/product_by_remark_model.dart';
import 'package:ostad_flutter_batch_two/data/services/network_caller.dart';

class ProductByRemarkController extends GetxController {
  bool _getPopularProductByRemarkInProgress = false;
  ProductByRemarkModel _popularProducts = ProductByRemarkModel();

  bool get getPopularProductByRemarkInProgress => _getPopularProductByRemarkInProgress;

  ProductByRemarkModel get popularProductsModel => _popularProducts;

  Future<bool> getPopularProductsByRemark() async {
    _getPopularProductByRemarkInProgress = true;
    update();
    final response =
        await NetworkCaller.getRequest(url: '/ListProductByRemark/popular');
    _getPopularProductByRemarkInProgress = false;
    if (response.isSuccess) {
      _popularProducts = ProductByRemarkModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
