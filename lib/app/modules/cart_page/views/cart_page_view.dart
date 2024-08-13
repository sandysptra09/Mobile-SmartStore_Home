import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartstore_home/app/routes/app_pages.dart';
import 'package:smartstore_home/app/shared/theme.dart';
import 'package:smartstore_home/app/widgets/CartItems.dart';

import '../controllers/cart_page_controller.dart';

class CartPageView extends GetView<CartPageController> {
  const CartPageView({Key? key}) : super(key: key);
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
                        "Cart",
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
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      CartItems(),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select All",
                              style: semibold.copyWith(fontSize: 14),
                            ),
                            Checkbox(
                              activeColor: emerald,
                              value: true,
                              onChanged: (value) {},
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Payment',
                              style: bold.copyWith(fontSize: 18),
                            ),
                            Text(
                              "Rp. 3.999.999",
                              style:
                                  medium.copyWith(fontSize: 18, color: emerald),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 130),
                          decoration: BoxDecoration(
                            color: emerald,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Checkout",
                            style: bold.copyWith(
                                fontSize: 17,
                                color: Colors.white.withOpacity(0.9)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    ));
  }
}
