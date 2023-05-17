import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/models/category_model.dart';
import 'package:ostad_flutter_batch_two/data/services/network_caller.dart';

class CategoryController extends GetxController {
  CategoryModel _categoryModel = CategoryModel();
  bool _getCategoryInProgress = false;

  bool get getCategoryInProgress => _getCategoryInProgress;

  CategoryModel get categoryModel => _categoryModel;

  Future<bool> getCategories() async {
    _getCategoryInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/CategoryList');
    _getCategoryInProgress = false;
    if (response.isSuccess) {
      _categoryModel = CategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
