import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/data/urls.dart';
import 'package:ostad_flutter_batch_two/ui/utils/text_styles.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/app_elevated_button.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/app_text_field_widget.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/screen_background_widget.dart';

import '../../data/network_utils.dart';
import '../utils/snackbar_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailETController = TextEditingController();
  final TextEditingController firstNameETController = TextEditingController();
  final TextEditingController lastNameETController = TextEditingController();
  final TextEditingController mobileETController = TextEditingController();
  final TextEditingController passwordETController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
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
                      hintText: 'Email',
                      controller: emailETController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextFieldWidget(
                      hintText: 'First name',
                      controller: firstNameETController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextFieldWidget(
                      hintText: 'Last name',
                      controller: lastNameETController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your last name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextFieldWidget(
                      hintText: 'Mobile',
                      controller: mobileETController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your valid mobile';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextFieldWidget(
                      hintText: 'Password',
                      controller: passwordETController,
                      validator: (value) {
                        if ((value?.isEmpty ?? true) &&
                            ((value?.length ?? 0) < 6)) {
                          return 'Enter password more than 6';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppElevatedButton(
                        child: const Icon(Icons.arrow_circle_right_outlined),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final result = await NetworkUtils().postMethod(
                              Urls.registrationUrl,
                              body: {
                                'email': emailETController.text.trim(),
                                'mobile': mobileETController.text.trim(),
                                'password': passwordETController.text,
                                'firstName': firstNameETController.text.trim(),
                                'lastName': lastNameETController.text.trim(),
                              },
                            );
                            if (result != null &&
                                result['status'] == 'success') {
                              emailETController.clear();
                              mobileETController.clear();
                              passwordETController.clear();
                              firstNameETController.clear();
                              lastNameETController.clear();
                              showSnackBarMessage(
                                  context, 'Registration successful!');
                            } else {
                              showSnackBarMessage(context,
                                  'Registration Failed! Try again', true);
                            }
                          }
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
      ),
    );
  }
}
