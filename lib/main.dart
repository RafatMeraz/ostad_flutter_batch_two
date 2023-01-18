import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        title: Text('Basics'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.red,
        elevation: 8,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: SafeArea(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Click')),
              ListTile(
                tileColor: Colors.grey,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                onTap: () {
                  print('tap');
                },
                onLongPress: () {
                  print('Long press');
                },
                title: Text('Ostad'),
                subtitle: Text('Learning platform'),
                leading: Icon(Icons.adb),
                trailing: Icon(Icons.arrow_right_alt),
              ),
              ListTile(
                tileColor: Colors.black12,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                onTap: () {
                  print('tap');
                },
                onLongPress: () {
                  print('Long press');
                },
                title: Text('Ostad'),
                subtitle: Text('Learning platform'),
                leading: Icon(Icons.adb),
                trailing: Icon(Icons.arrow_right_alt),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            color: Colors.blue,
            shadowColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              // side: BorderSide.lerp(BorderSide(
              //   color: Colors.white
              // ), BorderSide(
              //   color: Colors.red
              // ), 0.5)
            ),
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Ostad Batch 2'),
            ),
          ),
          // Row(
          //   children: [
          //     Radio(value: 'Male', groupValue: 'gender', onChanged: (value) {}),
          //     Text('Male'),
          //     Radio(
          //         value: 'Female', groupValue: 'gender', onChanged: (value) {}),
          //     Text('Female')
          //   ],
          // ),
          // Row(
          //   children: [
          //     Checkbox(value: true, onChanged: (value) {}),
          //     Text('Html'),
          //     Checkbox(value: false, onChanged: (value) {}),
          //     Text('Flutter'),
          //     Checkbox(value: true, onChanged: (value) {}),
          //     Text('IOS')
          //   ],
          // ),
          // Row(
          //   children: [
          //     Text('Dark mode'),
          //     Switch(value: false, onChanged: (value) {})
          //   ],
          // ),
          ListTile(
            title: Text('My name'),
            subtitle: Text('Mr John'),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            autovalidateMode: AutovalidateMode.always,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Enter your email';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Email'
            ),
          ),
          TextField(
            obscureText: true,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Submit'))
        ],
      ),
    );
  }
}
