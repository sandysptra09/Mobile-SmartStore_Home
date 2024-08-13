// SignUpController
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../providers/api.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  void onUsernameChanged(String value) {
    username.value = value;
  }

  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  Future<void> register() async {
    try {
      var response = await _performRegistration();
      var responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Registration Successful',
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.offAllNamed('/signin');
      } else {
        Get.snackbar(
            'Error', 'Registration failed. ${responseBody['message']}');
      }
    } catch (e) {
      print('Error during registration: $e');
      Get.snackbar('Error', 'An error occurred during registration');
    }
  }

  Future<http.Response> _performRegistration() async {
    var apiUrl = 'auth/register';
    var requestBody = {
      'username': username.value,
      'email': email.value,
      'password': password.value,
    };

    return await http.post(Uri.parse(Api.baseUrl + apiUrl),
        body: jsonEncode(requestBody),
        headers: {
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin": "*",
          'Accept': '/'
        });
  }

  void goToLogin() {
    Get.toNamed('/signin');
  }
}
