import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/ui/screens/bottom_nav_bar_screen.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/user_auth_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;

  const OTPVerificationScreen({Key? key, required this.email})
      : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpETController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(builder: (userAuthController) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 80,
                width: 80,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Enter OTP Code',
                style: titleTextStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'A 4 digit OTP code has been sent',
                style: subTitleTextStyle,
              ),
              const SizedBox(
                height: 24,
              ),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                controller: _otpETController,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 45,
                    fieldWidth: 45,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    selectedColor: Colors.green,
                    activeColor: primaryColor,
                    inactiveColor: primaryColor,
                    inactiveFillColor: Colors.white),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {},
                onChanged: (value) {},
                appContext: context,
              ),
              const SizedBox(
                height: 16,
              ),
              userAuthController.otpVerificationInProgress
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final bool response =
                              await userAuthController.otpVerification(
                                  widget.email, _otpETController.text);
                          if (response) {
                            Get.offAll(const BottomNavBarScreen());
                          } else {
                            Get.showSnackbar(
                              const GetSnackBar(
                                title: 'Otp verification Failed',
                                message:
                                    'Check once again before enter your otp',
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                        child: const Text('Next'),
                      ),
                    ),
              const SizedBox(
                height: 16,
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 13, color: softGreyColor),
                  text: 'This code will be expire in ',
                  children: [
                    TextSpan(
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.w600),
                      text: '120s',
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Resend Code',
                  style: TextStyle(color: greyColor.withOpacity(0.5)),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
