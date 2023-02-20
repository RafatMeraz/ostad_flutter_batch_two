import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/app_elevated_button.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/app_text_field_widget.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/screen_background_widget.dart';

import '../utils/text_styles.dart';
import 'login.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Set Password',
                  style: screenTitleTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                    'Minimum length of password must be 6 with letters and number combination',
                    style: screenSubTitleTextStyle),
                const SizedBox(
                  height: 24,
                ),
                AppTextFieldWidget(
                    obscureText: true,
                    hintText: 'Password',
                    controller: TextEditingController()),
                const SizedBox(
                  height: 8,
                ),
                AppTextFieldWidget(
                    obscureText: true,
                    hintText: 'Confirm Password',
                    controller: TextEditingController()),
                const SizedBox(
                  height: 16,
                ),
                AppElevatedButton(
                    child: const Text('Confirm'),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false);
                    }),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (route) => false);
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.green),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
