import 'package:flutter/material.dart';

import '../widgets/screen_background_widget.dart';
import '../widgets/task_list_item.dart';

class CompletedTasksScreen extends StatefulWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTasksScreen> createState() => _CompletedTasksScreenState();
}

class _CompletedTasksScreenState extends State<CompletedTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return TaskListItem(
            type: 'Completed',
            date: '12-34-45',
            description: 'oskjaflkdsalkf kfo kdlfk ld;kf kd;k; df',
            subject: 'Title will be here',
            onDeletePress: () {},
            onEditPress: () {},
          );
        },
      ),
    );
  }
}
