import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/getx_controllers/task_controller.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/screen_background_widget.dart';
import 'package:get/get.dart';

import '../widgets/dashboard_item.dart';
import '../widgets/status_change_bottom_sheet.dart';
import '../widgets/task_list_item.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({Key? key}) : super(key: key);

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<NewTaskController>().getAllNewTasks();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: DashboardItem(
                  typeOfTask: 'New',
                  numberOfTasks: 23,
                ),
              ),
              Expanded(
                child: DashboardItem(
                  typeOfTask: 'Completed',
                  numberOfTasks: 23,
                ),
              ),
              Expanded(
                child: DashboardItem(
                  typeOfTask: 'Cancelled',
                  numberOfTasks: 23,
                ),
              ),
              Expanded(
                child: DashboardItem(
                  typeOfTask: 'In Progress',
                  numberOfTasks: 23,
                ),
              ),
            ],
          ),
          GetBuilder<NewTaskController>(builder: (taskController) {
            return Expanded(
              child: taskController.getNewTaskInProgress
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        taskController.getAllNewTasks();
                      },
                      child: ListView.builder(
                        itemCount:
                            taskController.newTaskModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return TaskListItem(
                            type: 'New',
                            date: taskController
                                    .newTaskModel.data?[index].createdDate ??
                                'Unknown',
                            description: taskController
                                    .newTaskModel.data?[index].description ??
                                'Unknown',
                            subject: taskController
                                    .newTaskModel.data?[index].title ??
                                'Unknown',
                            onDeletePress: () {},
                            onEditPress: () {
                              showChangeTaskStatus(
                                'New',
                                taskController.newTaskModel.data?[index].sId ??
                                    '',
                                () {
                                  taskController.getAllNewTasks();
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
            );
          }),
        ],
      ),
    );
  }
}
