import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/models/task_model.dart';

import '../../data/network_utils.dart';
import '../../data/urls.dart';

class NewTaskController extends GetxController {
  bool getNewTaskInProgress = false;
  TaskModel newTaskModel = TaskModel();

  Future<bool> getAllNewTasks() async {
    getNewTaskInProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.newTasksUrls,
    );
    getNewTaskInProgress = false;
    if (response != null) {
      newTaskModel = TaskModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}

/// DATA - Independent
/// State holder - DATA dependent
/// UI/Widgets -  State Holder dependent
