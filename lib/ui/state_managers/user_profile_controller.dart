import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/models/profile_model.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/auth_controller.dart';

import '../../data/services/network_caller.dart';

class UserProfileController extends GetxController {
  bool _getProfileDataInProgress = false;

  bool get getProfileDataInProgress => _getProfileDataInProgress;

  Future<bool> getProfileData() async {
    _getProfileDataInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ReadProfile');
    _getProfileDataInProgress = false;
    if (response.isSuccess) {
      final ProfileModel profileModel = ProfileModel.fromJson(response.returnData);
      if (profileModel.data != null) {
        Get.find<AuthController>().saveProfileData(profileModel.data!.first);
      } else {
        // Get.to('CompleteProfile');
      }
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}