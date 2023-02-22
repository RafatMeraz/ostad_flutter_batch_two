import 'package:flutter/material.dart';

import '../widgets/screen_background_widget.dart';
import '../widgets/task_list_item.dart';

class InProgressTasksScreen extends StatefulWidget {
  const InProgressTasksScreen({Key? key}) : super(key: key);

  @override
  State<InProgressTasksScreen> createState() => _InProgressTasksScreenState();
}

class _InProgressTasksScreenState extends State<InProgressTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return TaskListItem(
            type: 'In Progress',
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
