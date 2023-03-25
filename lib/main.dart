import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/getx_controllers/auth_controller.dart';
import 'package:ostad_flutter_batch_two/ui/getx_controllers/task_controller.dart';
import 'package:ostad_flutter_batch_two/ui/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const TaskManagerApp());
}

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({Key? key}) : super(key: key);

  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: TaskManagerApp.globalKey,
      initialBinding: StoreBindings(),
      home: const SplashScreen(),
    );
  }
}


class StoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(TaskController());
  }
}