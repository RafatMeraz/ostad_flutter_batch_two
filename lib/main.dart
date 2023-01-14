import 'package:flutter/material.dart';

/// projects' entry point
/// SKIA / Impeller
///
/// Hot restart (ctl + \) (cmd + shift + \)
/// Hot reload (ctl + s) (cmd + s)
main() {
  print('Entry point');
  runApp(HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// property/attributes
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Screen', style: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w700
        ),),
        leading: Icon(Icons.adb, color: Colors.black, size: 32),
        elevation: 8,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      /*    Text('Text one'),
          Text('Text two'),
          Text('Text one'),
          Text('Text two'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.search),
              Text('Tap to search')
            ],
          ),
          Text('Another line'),
          Row(
            children: [
              Icon(Icons.search),
              Text('Tap to search')
            ],
          ),*/
          Container(
            // height: 200,
            // width: 200,
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green, width: 12),
            ),
            alignment: Alignment.center,
            child: Text(
              'Container',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  ),
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                  elevation: 5),
              onPressed: () {
                print('Hello');
              },
              child: Text('Tap me'),
            ),
          )
        ],
      ),
    );
  }

}








