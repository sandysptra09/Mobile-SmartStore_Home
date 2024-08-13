import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartstore_home/app/data/models/product_models.dart';
import 'package:smartstore_home/app/routes/app_pages.dart';
import 'package:smartstore_home/app/shared/theme.dart';
import 'package:badges/badges.dart' as badges;
import 'package:smartstore_home/app/widgets/HomeAppBar.dart';
import 'package:smartstore_home/app/widgets/BottomNavigationBar.dart'
    as CustomBottomNavigationBar;

import '../controllers/home_controller.dart';
import 'package:intl/intl.dart';

class HomeView extends GetView<HomeController> {
  // controller category
  final HomeController homeController = Get.put(HomeController());

  // get short description
  String _getShortenedDescription(String description) {
    int maxWords = 10;
    List<String> words = description.split(' ');
    if (words.length > maxWords) {
      return words.sublist(0, maxWords).join(' ') + '...';
    } else {
      return description;
    }
  }

  // formater price
  NumberFormat formatCurrency =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: HomeAppBar(),
        body: SingleChildScrollView(
            child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDECF2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            height: 50,
                            width: 300,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search here...',
                                hintStyle: regular.copyWith(fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image(
                          image: AssetImage('images/cover.jpg'),
                          width: MediaQuery.of(context).size.width / 1.2,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Row(
                          children: homeController.categoryList.map((category) {
                            return InkWell(
                              onTap: () {},
                              onHover: (isHovering) {},
                              child: Container(
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 18,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFEDECF2),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Text(
                                  category.categoryName ?? '',
                                  style: regular.copyWith(fontSize: 12),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 500,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: homeController.productList.length,
                        itemBuilder: (context, index) {
                          var product = homeController.productList[index];
                          return Flexible(
                            child: Container(
                              height: 200,
                              margin: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      color: Color.fromARGB(255, 224, 224, 224),
                                      child: Stack(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  Routes.DETAIL_PRODUCT);
                                            },
                                            child: Image(
                                              image: AssetImage(
                                                  'images/dummy_image_product.jpg'),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF7F8FA),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Icon(Icons.favorite,
                                                    size: 20,
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (product.slug != null) {
                                            Get.toNamed(
                                                "/detail-product/${product.slug}");
                                          } else {
                                            // Handle jika slug null
                                            print('Slug is null');
                                          }
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 2),
                                          child: Text(
                                            product.productName ?? '',
                                            style:
                                                semibold.copyWith(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          _getShortenedDescription(
                                              product.shortDescription ?? ''),
                                          style: regular.copyWith(fontSize: 13),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 4),
                                        child: Text(
                                          formatCurrency
                                              .format(product.price ?? 0),
                                          style: regular.copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: emerald),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
        bottomNavigationBar: CustomBottomNavigationBar.BottomNavigationBar());
  }
}
