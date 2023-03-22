import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/counter_controller.dart';
import 'package:ostad_flutter_batch_two/welcome_message_controller.dart';

void main() {
  runApp(const MyApp());
}

// class StoreBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<CounterController>(() => CounterController());
//     Get.lazyPut<WelcomeMessageController>(() => WelcomeMessageController());
//   }
// }

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
      home: HomeScreen(),
      // initialBinding: StoreBinding(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/settings', page: () => const SettingsScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterController>(builder: (counterController) {
              return Text(counterController.count.toString());
            }),
            ElevatedButton(
              onPressed: () {
                counterController.addCount();
              },
              child: const Text('Add'),
            ),
            ElevatedButton(
              onPressed: () {
                counterController.minusCount();
              },
              child: const Text('Minus'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(SecondScreen());
              },
              child: const Text('Second screen'),
            ),
            GetBuilder<CounterController>(builder: (counterController) {
              return Text(counterController.count.toString());
            }),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  final CounterController counterController = Get.find<CounterController>();
  final WelcomeMessageController welcomeMessageController =
      Get.put(WelcomeMessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen'),
      ),
      body: Column(
        children: [
          GetBuilder<CounterController>(builder: (counterController) {
            return Text(counterController.count.toString());
          }),
          GetBuilder<WelcomeMessageController>(builder: (messageController) {
            return Text(messageController.message);
          }),
          ElevatedButton(
            onPressed: () {
              welcomeMessageController
                  .changeMessage('Addition operation executed');
              counterController.addCount();
            },
            child: const Text('Add'),
          ),
          ElevatedButton(
            onPressed: () {
              welcomeMessageController.changeMessage('Subs operation executed');
              counterController.minusCount();
            },
            child: const Text('Minus'),
          ),
          GetBuilder<CounterController>(builder: (counterController) {
            return Text(counterController.count.toString());
          }),
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
                Get.offAll(const ThirdScreen(),
                    arguments: {"Rabbil": 123}, predicate: (route) => false);
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
