import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/screen_background_widget.dart';

import '../widgets/dashboard_item.dart';
import '../widgets/task_list_item.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({Key? key}) : super(key: key);

  @override
  State<NewTasksScreen> createState() => _NewTasksScreeenState();
}

class _NewTasksScreeenState extends State<NewTasksScreen> {
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
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return TaskListItem(
                  type: 'New',
                  date: '12-34-45',
                  description: 'oskjaflkdsalkf kfo kdlfk ld;kf kd;k; df',
                  subject: 'Title will be here',
                  onDeletePress: () {},
                  onEditPress: () {},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
