import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/models/product_by_category_model.dart';
import 'package:ostad_flutter_batch_two/data/services/network_caller.dart';

class ProductByRemarkController extends GetxController {
  bool _getPopularProductByRemarkInProgress = false;
  bool _getSpecialProductByRemarkInProgress = false;
  bool _getNewProductByRemarkInProgress = false;
  ProductByCategoryModel _popularProducts = ProductByCategoryModel();
  ProductByCategoryModel _newProducts = ProductByCategoryModel();
  ProductByCategoryModel _specialProducts = ProductByCategoryModel();

  bool get getPopularProductByRemarkInProgress => _getPopularProductByRemarkInProgress;

  bool get getNewProductByRemarkInProgress => _getNewProductByRemarkInProgress;

  bool get getSpecialProductByRemarkInProgress => _getSpecialProductByRemarkInProgress;

  ProductByCategoryModel get popularProductsModel => _popularProducts;

  ProductByCategoryModel get newProductsModel => _newProducts;

  ProductByCategoryModel get specialProductsModel => _specialProducts;

  Future<bool> getPopularProductsByRemark() async {
    _getPopularProductByRemarkInProgress = true;
    update();
    final response =
        await NetworkCaller.getRequest(url: '/ListProductByRemark/popular');
    _getPopularProductByRemarkInProgress = false;
    if (response.isSuccess) {
      _popularProducts = ProductByCategoryModel.fromJson(response.returnData);
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
    _newProducts = ProductByCategoryModel.fromJson(response.returnData);
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
      _specialProducts = ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
