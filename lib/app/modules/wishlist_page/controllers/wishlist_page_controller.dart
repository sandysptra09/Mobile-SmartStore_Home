import 'package:get/get.dart';
import 'package:smartstore_home/app/modules/profile-page/controllers/profile_page_controller.dart';

import '../../../data/models/wishlist_models.dart';
import '../../../providers/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WishlistPageController extends GetxController {
  ProfilePageController profilePageController =
      Get.put(ProfilePageController());
  var wishlistList = <Wishlist>[].obs;

  @override
  void onInit() {
    ever(profilePageController.isLoading, (_) {
      if (!profilePageController.isLoading.value) {
        fetchWishlistByIdUser();
      }
    });
  }

  // fetch all wishlist by user id login
  Future<void> fetchWishlistByIdUser() async {
    try {
      // Tambahkan pengecekan untuk userId yang null
      if (profilePageController.userId.value == null ||
          profilePageController.userId.value.isEmpty) {
        print('UserId is null or empty');
        return;
      }

      var apiUrl =
          '${Api.baseUrl}wishlist/${profilePageController.userId.value}';
      print(apiUrl);
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        print("$jsonResponse");
        wishlistList
            .assignAll(jsonResponse.map((model) => Wishlist.fromJson(model)));
      } else {
        throw Exception(
            'Failed to load all wishlist user: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error during fetching all wishlist: $e');
    }
  }
}
