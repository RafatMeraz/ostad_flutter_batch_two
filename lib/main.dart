import 'package:flutter/material.dart';

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
  TextEditingController controller = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('My Image'),
          Image.asset('assets/images/goat.jpg',
              height: 100, width: 200, fit: BoxFit.scaleDown),
          Image.network('https://miro.medium.com/max/1200/0*s7vGN34hz5jJUYTm.png'),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onChanged: (value) {
                // print(value);
              },
              onSubmitted: (value) {
                // print(value);
              },
              onTap: () {
                // print('Someone tap the text field');
              },
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8.0),
            color: Colors.green,
            child: TextField(
              controller: ageController,
              onChanged: (value) {
                // print(value);
              },
              onSubmitted: (value) {
                // print(value);
              },
              onTap: () {
                // print('Someone tap the text field');
              },
              decoration: InputDecoration(
                hintText: 'Enter your age',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(ageController.text)));
              // ScaffoldMessenger.of(context).showMaterialBanner(
              //     MaterialBanner(content: Text('Hello'), actions: [
              //   IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              // ]));
            },
            child: Text('Get Textfield value'),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // showAboutDialog(context: context);
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: Text('Somwthing'),
              content: Text('You are in danger'),
              actions: [
                TextButton(onPressed: () {}, child: Text('Cancel')),
                TextButton(onPressed: () {}, child: Text('Okay')),
              ],
            );
          });
        },
        label: Text('Press'),
      ),
    );
  }
}
