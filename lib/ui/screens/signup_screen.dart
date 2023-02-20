import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/utils/text_styles.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/app_elevated_button.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/app_text_field_widget.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/screen_background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Join with us',
                    style: screenTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Email', controller: TextEditingController()),
                  const SizedBox(
                    height: 8,
                  ),
                  AppTextFieldWidget(
                      hintText: 'First name',
                      controller: TextEditingController()),
                  const SizedBox(
                    height: 8,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Last name', controller: TextEditingController()),
                  const SizedBox(
                    height: 8,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Mobile', controller: TextEditingController()),
                  const SizedBox(
                    height: 8,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Password', controller: TextEditingController()),
                  const SizedBox(
                    height: 8,
                  ),
                  AppElevatedButton(
                      child: const Icon(Icons.arrow_circle_right_outlined),
                      onTap: () {}),
                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
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
      ),
    );
  }
}
