import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/settings', page: () => const SettingsScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(const SecondScreen());
              },
              child: const Text('Second Screen')),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/settings');
              },
              child: const Text('Settings Screen')),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/profile');
              },
              child: const Text('Profile Screen')),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Back')),
          ElevatedButton(
              onPressed: () {
                Get.off(const ThirdScreen(), arguments: ["Ostad", "Batch 2"]);
              },
              child: const Text('Third screen')),
          ElevatedButton(
              onPressed: () {
                Get.offAll(
                    const ThirdScreen(),
                    arguments: {"Rabbil" : 123},
                    predicate: (route) => false);
              },
              child: const Text('Third screen with empty stack'))
        ],
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.back(result: "sfdsfd");
              },
              child: const Text('Back'))
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.back(result: "sfdsfd");
              },
              child: const Text('Back'))
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.back(result: "sfdsfd");
              },
              child: const Text('Back'))
        ],
      ),
    );
  }
}
