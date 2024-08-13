import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartstore_home/app/data/models/wishlist_models.dart';
import 'package:smartstore_home/app/shared/theme.dart';
import 'package:intl/intl.dart';

class WishListItems extends StatelessWidget {
  final Wishlist wishlist;

  // formater price
  NumberFormat formatCurrency =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

  WishListItems({Key? key, required this.wishlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 244),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image(
                    image: AssetImage(
                  'images/dummy_image_product.jpg',
                )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      wishlist.product?.productName ?? '',
                      style: medium.copyWith(fontSize: 16),
                    ),
                    Text(
                      wishlist.product?.category!.categoryName ?? '',
                      style: regular.copyWith(fontSize: 12),
                    ),
                    Text(
                      formatCurrency.format(wishlist.product!.price ?? 0),
                      style: semibold.copyWith(fontSize: 14, color: emerald),
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: emerald,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
