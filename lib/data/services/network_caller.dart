import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:ostad_flutter_batch_two/data/utils/urls.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/auth_controller.dart';

import '../models/response_model.dart';

class NetworkCaller {
  // singleton
  NetworkCaller._();

  static Future<ResponseModel> getRequest({required String url}) async {
    try {
      print(AuthController.token.toString());
      final Response response =
          await get(Uri.parse(Urls.baseUrl + url), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'token': AuthController.token.toString(),
      });
      log(response.body);
      if (response.statusCode == 200) {
        return ResponseModel(
            isSuccess: true,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      } else {
        return ResponseModel(
            isSuccess: false,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
          isSuccess: false, statusCode: -1, returnData: e.toString());
    }
  }

  static Future<ResponseModel> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      print(AuthController.token.toString());
      print(body);
      final Response response = await post(Uri.parse(Urls.baseUrl + url),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'token': AuthController.token.toString(),
          },
          body: jsonEncode(body));
      log(response.body);
      if (response.statusCode == 200) {
        return ResponseModel(
            isSuccess: true,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      } else {
        return ResponseModel(
            isSuccess: false,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
          isSuccess: false, statusCode: -1, returnData: e.toString());
    }
  }
}
