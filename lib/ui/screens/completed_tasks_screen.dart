import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/status_change_bottom_sheet.dart';

import '../../data/models/task_model.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../utils/snackbar_message.dart';
import '../widgets/screen_background_widget.dart';
import '../widgets/task_list_item.dart';

class CompletedTasksScreen extends StatefulWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTasksScreen> createState() => _CompletedTasksScreenState();
}

class _CompletedTasksScreenState extends State<CompletedTasksScreen> {
  TaskModel completedTaskModel = TaskModel();
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getAllCompletedTasks();
  }

  Future<void> getAllCompletedTasks() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().getMethod(
      Urls.completedTasksUrls,
    );
    if (response != null) {
      completedTaskModel = TaskModel.fromJson(response);
    } else {
      showSnackBarMessage(
          context, 'Unable to fetch completed tasks! try again');
    }
    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: inProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                getAllCompletedTasks();
              },
              child: ListView.builder(
                itemCount: completedTaskModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return TaskListItem(
                    type: 'Completed',
                    date: completedTaskModel.data?[index].createdDate ??
                        'Unknown',
                    description: completedTaskModel.data?[index].description ??
                        'Unknown',
                    subject: completedTaskModel.data?[index].title ?? 'Unknown',
                    onDeletePress: () {},
                    onEditPress: () {
                      showChangeTaskStatus(
                        'Completed',
                          completedTaskModel.data?[index].sId ?? '', () {
                        getAllCompletedTasks();
                      });
                    },
                  );
                },
              ),
            ),
    );
  }
}
