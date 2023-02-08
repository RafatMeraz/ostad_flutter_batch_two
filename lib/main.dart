import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentSelectedScreenIndex = 0;

  /// assignment: replace this with 3 screens
  final List<Widget> widgets = [
    const Text('Dashboard'), // 0
    const Text('Products'), // 1
    const Text('Profile'), // 2
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom nav bar'),
        actions: [
          IconButton(
              onPressed: () async {
                // final selectedTime = await showTimePicker(
                //     context: context, initialTime: TimeOfDay.now());
                // print(selectedTime);
                // final selectedDate = await showDatePicker(context: context,
                //     initialDate: DateTime.now(),
                //     firstDate: DateTime(1990),
                //     lastDate: DateTime(2025));
                // print(selectedDate);
                // final selectedDateRange = await showDateRangePicker(
                //     context: context,
                //     firstDate: DateTime(2000),
                //     lastDate: DateTime(2040));
                // print(selectedDateRange);
              },
              icon: const Icon(Icons.lock_clock))
        ],
      ),
      body: Center(
        child: widgets[currentSelectedScreenIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black26,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.8,
            color: Colors.pink),
        onTap: (value) {
          currentSelectedScreenIndex = value;
          setState(() {});
        },
        currentIndex: currentSelectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              activeIcon: Icon(Icons.dangerous_outlined),
              icon: Icon(Icons.dashboard),
              label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
