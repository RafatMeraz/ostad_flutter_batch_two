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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home screen'),
            ElevatedButton(
                onPressed: () async {
                  /// route / screen
                  var value = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUs(name: 'Flutter',),
                    ),
                  );
                  print(value);
                },
                child: Text('Go to about us screen'))
          ],
        ),
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  String name;
  AboutUs({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About us'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            Text('About us screen'),
            ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => ContactUs()));
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => ContactUs()),
                          (route) => false);
                  /// assignment - What is predicate and what is does?
                },
                child: Text('Contact us page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Hello flutter');
                },
                child: Text('Back to home page'))
          ],
        ),
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact us'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contact us screen'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back to about page'))
          ],
        ),
      ),
    );
  }
}
