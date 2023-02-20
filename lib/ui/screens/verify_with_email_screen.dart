import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/utils/text_styles.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/app_elevated_button.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/app_text_field_widget.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/screen_background_widget.dart';

class VerifyWithEmailScreen extends StatefulWidget {
  const VerifyWithEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyWithEmailScreen> createState() => _VerifyWithEmailScreenState();
}

class _VerifyWithEmailScreenState extends State<VerifyWithEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Email Address',
                  style: screenTitleTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                    'A 6 digits verification pin will be sent to your email address',
                    style: screenSubTitleTextStyle),
                const SizedBox(
                  height: 24,
                ),
                AppTextFieldWidget(
                    hintText: 'Email Address',
                    controller: TextEditingController()),
                const SizedBox(
                  height: 16,
                ),
                AppElevatedButton(
                    child: const Icon(Icons.arrow_circle_right_outlined),
                    onTap: () {}),
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
    );
  }
}
