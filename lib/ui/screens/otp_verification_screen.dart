import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../widgets/common_elevated_button.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              controller: TextEditingController(),
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
                inactiveFillColor: Colors.white
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              onCompleted: (v) {
              },
              onChanged: (value) {},
              appContext: context,
            ),
            const SizedBox(
              height: 16,
            ),
            CommonElevatedButton(
              title: 'Next',
              onTap: () {},
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
      ),
    );
  }
}
