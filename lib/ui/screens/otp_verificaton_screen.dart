import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/screens/login.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/app_elevated_button.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/screen_background_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/text_styles.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
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
                  'Pin Verification',
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
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    selectedColor: Colors.green,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 16,
                ),
                AppElevatedButton(child: const Text('Verify'), onTap: () {}),
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
                            context, MaterialPageRoute(builder: (
                            context) => const LoginScreen()), (route) => false);
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
