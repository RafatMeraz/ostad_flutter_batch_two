import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:ostad_flutter_batch_two/data/auth_utils.dart';
import 'package:ostad_flutter_batch_two/main.dart';
import 'package:ostad_flutter_batch_two/ui/screens/login.dart';

class NetworkUtils {
  /// Get request
  Future<dynamic> getMethod(String url, {VoidCallback? onUnAuthorize}) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {
          moveToLogin();
        }
      } else {
        log("Something went wrong");
      }
    } catch (e) {
      log('Error $e');
    }
  }

  /// Get request
  Future<dynamic> postMethod(String url,
      {Map<String, String>? body,
      VoidCallback? onUnAuthorize,
      String? token}) async {
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json", 'token': token ?? ''},
          body: jsonEncode(body));
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {
          moveToLogin();
        }
      } else {
        log("Something went wrong ${response.statusCode}");
      }
    } catch (e) {
      log('Error $e');
    }
  }

  void moveToLogin() async {
    await AuthUtils.clearData();
    Navigator.pushAndRemoveUntil(
        TaskManagerApp.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}
