import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/data/models/task_model.dart';
import 'package:ostad_flutter_batch_two/data/network_utils.dart';
import 'package:ostad_flutter_batch_two/data/urls.dart';
import 'package:ostad_flutter_batch_two/ui/utils/snackbar_message.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/screen_background_widget.dart';

import '../widgets/dashboard_item.dart';
import '../widgets/task_list_item.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({Key? key}) : super(key: key);

  @override
  State<NewTasksScreen> createState() => _NewTasksScreeenState();
}

class _NewTasksScreeenState extends State<NewTasksScreen> {
  TaskModel newTaskModel = TaskModel();
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getAllNewTasks();
  }

  Future<void> getAllNewTasks() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().getMethod(
      Urls.newTasksUrls,
    );
    if (response != null) {
      newTaskModel = TaskModel.fromJson(response);
    } else {
      showSnackBarMessage(context, 'Unable to fetch new tasks! try again');
    }
    inProgress = false;
    setState(() {});
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
          Expanded(
            child: inProgress
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      getAllNewTasks();
                    },
                    child: ListView.builder(
                      itemCount: newTaskModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return TaskListItem(
                          type: 'New',
                          date: newTaskModel.data?[index].createdDate ??
                              'Unknown',
                          description: newTaskModel.data?[index].description ??
                              'Unknown',
                          subject: newTaskModel.data?[index].title ?? 'Unknown',
                          onDeletePress: () {},
                          onEditPress: () {},
                        );
                      },
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
