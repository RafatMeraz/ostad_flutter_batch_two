import 'package:flutter/material.dart';

import '../widgets/screen_background_widget.dart';
import '../widgets/task_list_item.dart';

class CancelledTasksScreen extends StatefulWidget {
  const CancelledTasksScreen({Key? key}) : super(key: key);

  @override
  State<CancelledTasksScreen> createState() => _CancelledTasksScreenState();
}

class _CancelledTasksScreenState extends State<CancelledTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return TaskListItem(
            type: 'Cancelled',
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
