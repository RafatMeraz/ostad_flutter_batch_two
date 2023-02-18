import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/screen_background_widget.dart';

import '../utils/text_styles.dart';
import '../widgets/app_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Get Started With',
                style: screenTitleTextStyle,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            AppTextFieldWidget(
              controller: TextEditingController(),
              hintText: 'Email',
            ),
            const SizedBox(
              height: 16,
            ),
            AppTextFieldWidget(
              obscureText: true,
              hintText: 'Password',
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
