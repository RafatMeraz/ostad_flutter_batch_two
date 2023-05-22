import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/models/product_by_remark_model.dart';
import 'package:ostad_flutter_batch_two/data/services/network_caller.dart';

class ProductByRemarkController extends GetxController {
  bool _getPopularProductByRemarkInProgress = false;
  bool _getSpecialProductByRemarkInProgress = false;
  bool _getNewProductByRemarkInProgress = false;
  ProductByRemarkModel _popularProducts = ProductByRemarkModel();
  ProductByRemarkModel _newProducts = ProductByRemarkModel();
  ProductByRemarkModel _specialProducts = ProductByRemarkModel();

  bool get getPopularProductByRemarkInProgress => _getPopularProductByRemarkInProgress;

  bool get getNewProductByRemarkInProgress => _getNewProductByRemarkInProgress;

  bool get getSpecialProductByRemarkInProgress => _getSpecialProductByRemarkInProgress;

  ProductByRemarkModel get popularProductsModel => _popularProducts;

  ProductByRemarkModel get newProductsModel => _newProducts;

  ProductByRemarkModel get specialProductsModel => _specialProducts;

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

  Future<bool> getNewProductsByRemark() async {
    _getNewProductByRemarkInProgress = true;
    update();
    final response =
        await NetworkCaller.getRequest(url: '/ListProductByRemark/new');
    _getNewProductByRemarkInProgress = false;
    if (response.isSuccess) {
    _newProducts = ProductByRemarkModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getSpecialProductsByRemark() async {
    _getSpecialProductByRemarkInProgress = true;
    update();
    final response =
        await NetworkCaller.getRequest(url: '/ListProductByRemark/special');
    _getSpecialProductByRemarkInProgress = false;
    if (response.isSuccess) {
      _specialProducts = ProductByRemarkModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
