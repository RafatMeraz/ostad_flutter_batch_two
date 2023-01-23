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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        // child: CircularProgressIndicator(
        //   strokeWidth: 14,
        //   color: Colors.red,
        //   backgroundColor: Colors.black45,
        //   value: 0.5,
        //   // valueColor: Colors.green,
        //   /// task : assign a animation color for value color
        // ),
        // child: SizedBox(
        //   width: 300,
        //   child: LinearProgressIndicator(
        //     minHeight: 10,
        //     value: 0.7,
        //     color: Colors.pink,
        //     backgroundColor: Colors.pink.shade50,
        //   ),
        // ),
        // child: CircleAvatar(
        //   backgroundColor: Colors.deepOrange,
        //   backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/3/33/Tom_Cruise_by_Gage_Skidmore_2.jpg'),
        //   /// task - set a asset image here
        //   radius: 50,
        //   child: Icon(Icons.icecream, size: 50),
        // ),
        // child: Image.network('icons/heart.png'),
        // child: AssetImage('icons/hear.png'),
        child: ListTile(
          title: Text('Shuvo Khan', style: TextStyle(
            color: Colors.white
          ),),
          subtitle: Text('Student',),
          leading: CircleAvatar(child: Text('1')),
          trailing: Icon(Icons.person_outline_sharp),
          tileColor: Colors.blueGrey,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
          onTap: () {
            print('Pressed');
          },
          onLongPress: () {
            print('On long press');
          },
        ),
      ),
    );
  }
}
/// widgets
//Image.network
//Image.asset

/// image provider
//NetworkImage
//AssetImage







