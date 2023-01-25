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
      home:  Home(),
    );
  }
}

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);

   List<String> students = [
     'Rahim',
     'Karim',
     'Nayeam',
     'Jakir',
     'Jakir',
     'Jakir',
     'Rafat'
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      // body: Scrollbar(
      //   thickness: 15,
      //   radius: Radius.circular(15),
      //   thumbVisibility: true,
      //   child: ListView.separated(
      //     itemCount: 500,
      //     addAutomaticKeepAlives: true,
      //     // scrollDirection: Axis.horizontal,
      //     // reverse: true,
      //     itemBuilder: (context, index) {
      //       return Row(
      //         children: [
      //           Text('Rafat $index'),
      //           Icon(Icons.person)
      //         ],
      //       );
      //     },
      //     separatorBuilder: (context, index) {
      //       // return Icon(Icons.adb);
      //       return Divider(
      //         thickness: 2,
      //         height: 30,
      //         color: Colors.deepOrange,
      //       );
      //     },
      //   ),
      // ),
      // body: GridView(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2
      //   ),
      //   children: [
      //     Text('Text'),
      //     Text('Text'),
      //     Text('Text'),
      //     Text('Text'),
      //     Text('Text'),
      //     Text('Text'),
      //     Text('Text'),
      //     Text('Text'),
      //     Text('Text'),
      //     Text('Text'),
      //     Text('Text'),
      //     Text('Text'),
      //   ],
      // ),
      body: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(students[index]),
            );
          },
      ),
    );
  }
}







