import 'dart:convert';

import 'package:get/get.dart';
import 'package:smartstore_home/app/modules/detail_product/views/detail_product_view.dart';
import '../../../data/models/category_models.dart' as CategoryModel;
import '../../../data/models/product_models.dart';
import '../../../providers/api.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  // state for data category
  var categoryList = <CategoryModel.Category>[].obs;

  // state for data product
  var productList = <Rows>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataCategory();
    fetchDataProduct();
  }

  // fetch data category
  Future<void> fetchDataCategory() async {
    try {
      var apiUrl = '${Api.baseUrl}categories';
      // var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        // headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)["data"]['rows'];
        print("$jsonResponse");
        categoryList.assignAll(jsonResponse
            .map((model) => CategoryModel.Category.fromJson(model)));
      } else {
        throw Exception(
            'Failed to load all categories: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error during fetching categories: $e');
    }
  }

  // fetch data product
  Future<void> fetchDataProduct() async {
    try {
      var apiUrl = '${Api.baseUrl}products';
      // var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        // headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)["data"]['rows'];
        print("$jsonResponse");
        productList
            .assignAll(jsonResponse.map((model) => Rows.fromJson(model)));
      } else {
        throw Exception(
            'Failed to load all categories: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error during fetching categories: $e');
    }
  }

  // go to detail product
  // void goToProductyDetails(Data product) {
  //   Get.to(() => DetailProductView(product: product));
  // }
}
