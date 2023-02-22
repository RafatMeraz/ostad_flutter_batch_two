import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/screens/add_new_task_screen.dart';
import 'package:ostad_flutter_batch_two/ui/screens/cancelled_tasks_screen.dart';
import 'package:ostad_flutter_batch_two/ui/screens/completed_tasks_screen.dart';
import 'package:ostad_flutter_batch_two/ui/screens/inprogress_tasks_screen.dart';
import 'package:ostad_flutter_batch_two/ui/screens/new_tasks_screen.dart';

import '../widgets/user_profile_widget.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedScreen = 0;
  final List<Widget> _screens = const [
    NewTasksScreen(),
    CompletedTasksScreen(),
    CancelledTasksScreen(),
    InProgressTasksScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileWidget(),
            Expanded(child: _screens[_selectedScreen]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => const AddNewTaskScreen()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black38,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        onTap: (index) {
          _selectedScreen = index;
          setState(() {});
        },
        elevation: 4,
        currentIndex: _selectedScreen,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.new_label_outlined), label: 'New'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_outline), label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.close_outlined), label: 'Cancelled'),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_sharp), label: 'Progress'),
        ],
      ),
    );
  }
}