import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartstore_home/app/data/models/product_models.dart';
import 'package:smartstore_home/app/routes/app_pages.dart';
import 'package:smartstore_home/app/shared/theme.dart';
import 'package:smartstore_home/app/providers/api.dart';
import 'package:html/parser.dart' show parse;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../controllers/detail_product_controller.dart';
import 'package:intl/intl.dart';

class DetailProductView extends GetView<DetailProductController> {
  DetailProductView({Key? key}) : super(key: key);

  // formater price
  NumberFormat formatCurrency =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

  @override
  Widget build(BuildContext context) {
    // get slug in params
    final slug = Get.parameters['slug'];

    // handle if slug not found
    if (slug == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Slug not found'),
        ),
      );
    }

    // get fetch detail slug from controller with slug as params
    controller.fetchProductDetail(slug);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () {
              final product = controller.productDetail.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    height: MediaQuery.of(context).size.height / 1.7,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/dummy_image_product.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed('/home');
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 22,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.addToWishlist(
                                  int.parse(controller
                                      .profilePageController.userId.value),
                                  product.id!);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Icon(
                                Icons.favorite,
                                size: 22,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  formatCurrency.format(product.price ?? 0),
                                  style: semibold.copyWith(
                                      fontSize: 20, color: emerald),
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Text(
                                product.productName ?? '',
                                style: semibold.copyWith(fontSize: 24),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(product.shortDescription ?? '',
                            style: medium.copyWith(fontSize: 14)),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Product Information :',
                          style: medium.copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Category',
                                  style: semibold.copyWith(
                                    fontSize: 13,
                                  ),
                                ),
                                Text(' : ',
                                    style: medium.copyWith(
                                      fontSize: 13,
                                    )),
                                Text(product.category?.categoryName ?? '',
                                    style: medium.copyWith(
                                      fontSize: 13,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Brand',
                                    style: semibold.copyWith(
                                      fontSize: 13,
                                    )),
                                Text(' : ',
                                    style: medium.copyWith(
                                      fontSize: 13,
                                    )),
                                Text(product.brand?.brandName ?? '',
                                    style: medium.copyWith(
                                      fontSize: 13,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('${product.stock ?? ''} in Stock',
                                style: medium.copyWith(
                                  fontSize: 13,
                                )),
                            SizedBox(
                              height: 4,
                            ),
                            Text('${product.weight ?? ''} gram',
                                style: medium.copyWith(
                                  fontSize: 13,
                                )),
                            SizedBox(
                              height: 4,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Description of product :',
                          style: medium.copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          parse(product.description ?? '').body!.text.trim(),
                          style: medium.copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'How to install the product :',
                          style: medium.copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          parse('<ol>${product.howToInstall ?? ''}</ol>')
                              .body!
                              .text
                              .trim(),
                          style: medium.copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        RatingBar.builder(
                          unratedColor: Color.fromARGB(255, 223, 221, 221),
                          itemSize: 28,
                          initialRating: 4.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4),
                          onRatingUpdate: (rating) {},
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Buyer Reviews",
                                style: medium.copyWith(fontSize: 14)),
                            SizedBox(
                              height: 6,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.person, size: 20),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Text(
                                        "Name of buyer",
                                        style: bold.copyWith(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Review Title",
                                      style: medium.copyWith(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Review of product",
                                      style: regular.copyWith(fontSize: 12),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF7F8FA),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Icon(
                                    CupertinoIcons.cart_fill,
                                    size: 22,
                                    color: emerald,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offAllNamed(Routes.CART_PAGE);
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 70),
                                    decoration: BoxDecoration(
                                        color: emerald,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text(
                                      'Buy Now',
                                      style: bold.copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          letterSpacing: 1),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
