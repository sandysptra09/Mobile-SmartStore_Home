import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../providers/api.dart';

class ProfilePageController extends GetxController {
  var isLoading = true.obs;
  var user = {}.obs;
  var userId = ''.obs;

  void setUserId(String id) {
    userId.value = id;
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      // get the token from SharedPreferences
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = localStorage.getString('token');

      // check if token exists before making the request
      if (token == null) {
        throw Exception('Token not found');
      }

      // set the Authorization header with the token
      var headers = {'Authorization': 'Bearer $token'};

      // perform user details API request
      var apiUrl = 'user/me';
      var response = await http.get(
        Uri.parse(Api.baseUrl + apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var apiResponse = json.decode(response.body);
        user.value = apiResponse;
        print(apiResponse);
        userId.value = apiResponse['id'].toString();
        print(userId);
      } else {
        throw Exception('Failed to load user details');
      }
    } catch (e) {
      print('Error during fetching user details: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
