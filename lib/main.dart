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
        home: Home());
  }
}
/// MediaQuery
/// Layout builder
/// Orientation builder
/// Fractional Sizedbox
/// Flexible
/// Expanded


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // print(size.width);
    // print(size.height);
    // print(size.aspectRatio);
    return Scaffold(
      // body: LayoutBuilder(
      //   builder: (context, constraints) {
      //     if (constraints.maxWidth < 500) {
      //       return Center(
      //         child: Text('Small phone'),
      //       );
      //     } else if (constraints.maxWidth < 700) {
      //       return Center(
      //         child: Text('Big phone'),
      //       );
      //     } else if (constraints.maxWidth < 1000) {
      //       return Center(
      //         child: Text('Tablet'),
      //       );
      //     } else if (constraints.maxWidth < 1500) {
      //       return Center(
      //         child: Text('Desktop'),
      //       );
      //     }
      //     return Center(
      //       child: Column(
      //         children: [
      //           Text(constraints.minWidth.toString()),
      //           Text(constraints.maxWidth.toString()),
      //           Text(constraints.maxHeight.toString()),
      //           Text(constraints.minHeight.toString()),
      //         ],
      //       ),
      //     );
      //   },
      // )
      // body: OrientationBuilder(
      //   builder: (context, orientation) {
      //     if (orientation == Orientation.portrait) {
      //       return Center(child: Text('Portrait'));
      //     } else {
      //       return Center(child: Text('Landscape'));
      //     }
      //   },
      // ),
      // body: SafeArea(
      //   child: FractionallySizedBox(
      //     heightFactor: 0.7,
      //     widthFactor: 0.3,
      //     child: Container(
      //       color: Colors.blueGrey,
      //       child: Center(
      //         child: Text('Hello'),
      //       ),
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 10,
            child: Container(
              height: 20,
              width: 200,
              color: Colors.deepOrange,),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 5,
            child: Container(
              height: 50,
              width: 200,
              color: Colors.pink,),
          ),
          // SizedBox(height: 50,),
          // SizedBox(height: 50,),
        ],
      ),
    );
  }
}
