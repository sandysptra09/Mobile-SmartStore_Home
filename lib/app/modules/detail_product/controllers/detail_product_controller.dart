import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartstore_home/app/data/models/detail_product_models.dart';
import 'package:smartstore_home/app/modules/profile-page/controllers/profile_page_controller.dart';
// import 'package:smartstore_home/app/data/models/product_models.dart';
import 'package:smartstore_home/app/providers/api.dart';
import 'package:http/http.dart' as http;

class DetailProductController extends GetxController {
  final ProfilePageController profilePageController =
      Get.put(ProfilePageController());

  final productDetail = Data().obs;

  @override
  void onInit() {
    super.onInit();
  }

  // fetch detail product
  Future<void> fetchProductDetail(String slug) async {
    try {
      var apiUrl = '${Api.baseUrl}product-by-slug/$slug';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['data'] != null) {
          productDetail.value = Data.fromJson(jsonResponse['data']);
        } else {
          throw Exception('Invalid JSON format: data field is null');
        }
      } else {
        throw Exception(
            'Failed to load product detail: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during fetching product detail: $e');
    }
  }

  // add product to wishlist
  Future<void> addToWishlist(int userId, int productId) async {
    try {
      var apiUrl = '${Api.baseUrl}wishlist';
      var headers = await Api.getHeaders();
      var body = {
        'user_id': userId.toString(),
        'product_id': productId.toString()
      };

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Product added to wishlist',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        throw Exception('Failed to add to wishlist: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during adding to wishlist: $e');
    }
  }
}
