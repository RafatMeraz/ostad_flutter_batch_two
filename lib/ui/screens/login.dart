import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/screens/signup_screen.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/screen_background_widget.dart';

import '../utils/text_styles.dart';
import '../widgets/app_elevated_button.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get Started With',
                style: screenTitleTextStyle,
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
              const SizedBox(
                height: 16,
              ),
              AppElevatedButton(
                onTap: () {},
                child: const Icon(Icons.arrow_circle_right_outlined),
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
