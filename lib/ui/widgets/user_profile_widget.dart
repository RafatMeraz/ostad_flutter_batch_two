import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      leading: CircleAvatar(child: Icon(Icons.person)),
      tileColor: Colors.green,
      title: Text('Rabbil Hasan'),
      subtitle: Text('rabbil@gamil.com'),
    );
  }
}
