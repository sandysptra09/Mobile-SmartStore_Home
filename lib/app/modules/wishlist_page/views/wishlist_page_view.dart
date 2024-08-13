import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartstore_home/app/data/models/wishlist_models.dart';
import 'package:smartstore_home/app/routes/app_pages.dart';
import 'package:smartstore_home/app/shared/theme.dart';
import 'package:smartstore_home/app/widgets/WishlistItems.dart';

import '../controllers/wishlist_page_controller.dart';

class WishlistPageView extends GetView<WishlistPageController> {
  WishlistPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.HOME);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 22,
                            ),
                          ),
                          Text(
                            "Wishlist",
                            style: bold.copyWith(fontSize: 20),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.more_horiz,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.wishlistList.length,
                        itemBuilder: (context, index) {
                          return WishListItems(
                              wishlist: controller.wishlistList[index]);
                        },
                      ),
                    )
                    // Container(
                    //   padding: EdgeInsets.only(top: 15),
                    //   child: Column(),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
