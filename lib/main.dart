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
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Responsive design'),
//       ),
//       // body: Scrollbar(
//       //   child: SingleChildScrollView(
//       //     child: Column(
//       //       children: [
//       //         Text('Text'),
//       //         SingleChildScrollView(
//       //           scrollDirection: Axis.horizontal,
//       //           child: Row(
//       //             children: [
//       //               Text('Row data kjskjfkjgkfjg'),
//       //               Text('Row data kjskjfkjgkfjg'),
//       //               Text('Row data kjskjfkjgkfjg'),
//       //               Text('Row data kjskjfkjgkfjg'),
//       //               Text('Row data kjskjfkjgkfjg'),
//       //               Text('Row data kjskjfkjgkfjg'),
//       //               Text('Row data kjskjfkjgkfjg'),
//       //               Text('Row data kjskjfkjgkfjg'),
//       //             ],
//       //           ),
//       //         ),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Divider(),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         SizedBox(height: 50,),
//       //         SizedBox(height: 50,),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         SizedBox(height: 150,),
//       //
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         SizedBox(height: 100,),
//       //
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         Text('Text'),
//       //         SizedBox(height: 50,),
//       //         Text('Text'),
//       //         Text('Text'),
//       //       ],
//       //     ),
//       //   ),
//       // ),
//       body: Container(
//         height: 300,
//         width: 500,
//         color: Colors.blueGrey,
//         alignment: Alignment.center,
//         child: AspectRatio(
//           aspectRatio: 2/1,
//           child: Container(
//             color: Colors.pink,
//             alignment: Alignment.topLeft,
//             child: Text('dfff'),
//           ),
//         ),
//       ),
//     );
//   }
// }

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab bar view'),
          bottom: TabBar(
            onTap: (value) {
              print(value);
            },
            tabs: [
              Tab(
                text: 'History',
                // icon: Icon(Icons.access_time_outlined),
              ),
              Tab(
                text: 'Settings',
                // icon: Icon(Icons.settings),
              ),
              Tab(
                // text: 'Mirroring',
                // icon: Icon(Icons.settings),
                child: Row(
                  children: [Icon(Icons.adb), Text('Widget')],
                ),
              ),
            ],
            isScrollable: false,
            labelColor: Colors.black,
            // labelStyle: TextStyle(
            //   fontWeight: FontWeight.bold,
            //   color: Colors.black
            // ),
            indicatorColor: Colors.green,
            indicatorWeight: 10,
            unselectedLabelColor: Colors.red,
            // indicator: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.circular(2)
            // ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('History'),
            ),
            Center(
              child: Text('Settings'),
            ),
            Center(
              child: Text('Mirroring'),
            ),
          ],
        ),
      ),
    );
  }
}
