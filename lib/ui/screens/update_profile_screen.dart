import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ostad_flutter_batch_two/data/auth_utils.dart';
import 'package:ostad_flutter_batch_two/data/network_utils.dart';
import 'package:ostad_flutter_batch_two/data/urls.dart';
import 'package:ostad_flutter_batch_two/ui/utils/snackbar_message.dart';
import 'package:ostad_flutter_batch_two/ui/utils/text_styles.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/app_elevated_button.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/app_text_field_widget.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/user_profile_widget.dart';

import '../widgets/screen_background_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _firstNameETController = TextEditingController();
  final TextEditingController _lastNameETController = TextEditingController();
  final TextEditingController _mobileETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();

  XFile? pickedImage;
  String? base64Image;

  @override
  void initState() {
    super.initState();
    _emailETController.text = AuthUtils.email ?? '';
    _firstNameETController.text = AuthUtils.firstName ?? '';
    _lastNameETController.text = AuthUtils.lastName ?? '';
    _mobileETController.text = AuthUtils.mobile ?? '';
  }

  void updateProfile() async {
    if (pickedImage != null) {
      List<int> imageBytes = await pickedImage!.readAsBytes();
      print(imageBytes);
      base64Image = base64Encode(imageBytes);
      print(base64Image);
    }

    Map<String, String> bodyParams = {
    'firstName' : _firstNameETController.text.trim(),
    'lastName' : _lastNameETController.text.trim(),
    'mobile' : _mobileETController.text.trim(),
    'photo' : base64Image ?? ''
    };

    if (_passwordETController.text.isNotEmpty) {
      bodyParams['password'] = _passwordETController.text;
    }

    final result = await NetworkUtils().postMethod(Urls.profileUpdateUrl, body: bodyParams);
    if (result != null && result['status'] == 'success') {
      // TODO - Update cache data
      showSnackBarMessage(context, 'Profile data updated');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileWidget(),
            Expanded(
                child: ScreenBackground(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Update Profile',
                        style: screenTitleTextStyle,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: () async {
                          pickImage();
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  )),
                              child: const Text('Photo'),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    )),
                                child: Text(
                                  pickedImage?.name ?? '',
                                  maxLines: 1,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextFieldWidget(
                        hintText: 'Email',
                        controller: _emailETController,
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextFieldWidget(
                        hintText: 'First Name',
                        controller: _firstNameETController,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextFieldWidget(
                        hintText: 'Last Name',
                        controller: _lastNameETController,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextFieldWidget(
                        hintText: 'Mobile',
                        controller: _mobileETController,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextFieldWidget(
                        hintText: 'Password',
                        obscureText: true,
                        controller: _passwordETController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppElevatedButton(
                        child: const Icon(Icons.arrow_circle_right_outlined),
                        onTap: () {
                          updateProfile();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  void pickImage() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Pick image from'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () async {
                    pickedImage = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (pickedImage != null) {
                      setState(() {});
                    }
                  },
                  leading: const Icon(Icons.camera),
                  title: const Text('Camera'),
                ),
                ListTile(
                  onTap: () async {
                    pickedImage = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      setState(() {});
                    }
                  },
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                ),
              ],
            ),
          );
        });
  }

}
