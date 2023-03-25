import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/getx_controllers/auth_controller.dart';
import 'package:ostad_flutter_batch_two/ui/screens/main_%20bottom_nav_bar.dart';
import 'package:ostad_flutter_batch_two/ui/screens/signup_screen.dart';
import 'package:ostad_flutter_batch_two/ui/screens/verify_with_email_screen.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/screen_background_widget.dart';
import 'package:get/get.dart';

import '../utils/text_styles.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
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
                  controller: _emailETController,
                  hintText: 'Email',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFieldWidget(
                  obscureText: true,
                  hintText: 'Password',
                  controller: _passwordETController,
                  validator: (value) {
                    if ((value?.isEmpty ?? true) &&
                        ((value?.length ?? 0) < 6)) {
                      return 'Enter password more than 6';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<AuthController>(builder: (authController) {
                  if (authController.loginInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  }
                  return AppElevatedButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        final bool result = await authController.login(
                            _emailETController.text.trim(),
                            _passwordETController.text);
                        if (result) {
                          Get.offAll(() => const MainBottomNavBar());
                        } else {
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: 'Login failed! Try again.',
                            ),
                          );
                        }
                      }
                    },
                    child: const Icon(Icons.arrow_circle_right_outlined),
                  );
                }),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Get.to(const VerifyWithEmailScreen());
                    },
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
                        Get.to(const SignUpScreen());
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
      ),
    );
  }
}
