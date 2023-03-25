import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/data/auth_utils.dart';
import 'package:ostad_flutter_batch_two/ui/screens/login_screen.dart';
import 'package:ostad_flutter_batch_two/ui/screens/update_profile_screen.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const UpdateProfileScreen()));
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      leading: const CircleAvatar(child: Icon(Icons.person)),
      tileColor: Colors.green,
      title: Text('${AuthUtils.firstName ?? ''} ${AuthUtils.lastName ?? ''}'),
      subtitle: Text(AuthUtils.email ?? 'Unknown'),
      trailing: IconButton(
        onPressed: () async {
          await AuthUtils.clearData();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) => LoginScreen()), (route) => false);
        },
        icon: const Icon(Icons.logout, color: Colors.white,),
      ),
    );
  }
}
