import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}

/// lifecycle
/// 1. Create state
/// 2. Init state
/// 3. didChangeDependencies()
/// 4. build()
/// 5. setState()
/// 6. didUpdateWidget()
/// 7. deactivated()
/// 8. dispose()
/// 9. mounted()

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String text = 'Hello';
  int times = 0;

  @override
  void initState() {
    super.initState();
    print('Init state');
  }

  @override
  void didChangeDependencies() {
    print('Did change dependency');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('did update widget');
  }

  @override
  Widget build(BuildContext context) {
    print('Build called');
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mounted) {
            print('Yes, you are visible');
          }
          text = 'Hi';
          times = times + 1;
          setState(() {});
        },
        child: Icon(Icons.abc),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('$text\t'), Text(times.toString())],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    print('deactivate called');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose called');
    super.dispose();
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          child: Text('Go to Home'),
        ),
      ),
    );
  }
}
