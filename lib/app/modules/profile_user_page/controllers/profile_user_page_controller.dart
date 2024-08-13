import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileUserPageController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  // function logout
  Future<void> logout() async {
    try {
      // clear token or user data from local storage
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('token');
      localStorage.remove('user');

      // navigate to login page
      Get.offAllNamed('/signin');
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}
