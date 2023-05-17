import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/models/home_slider_model.dart';
import 'package:ostad_flutter_batch_two/data/services/network_caller.dart';

class HomeController extends GetxController {
  bool _getSliderInProgress = false;
  HomeSliderModel _homeSliderModel = HomeSliderModel();
  
  bool get getSliderInProgress => _getSliderInProgress;

  HomeSliderModel get homeSliderModel => _homeSliderModel;
  
  Future<bool> getHomeSlider() async {
    _getSliderInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListProductSlider');
    _getSliderInProgress = false;
    if (response.isSuccess) {
      _homeSliderModel = HomeSliderModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}