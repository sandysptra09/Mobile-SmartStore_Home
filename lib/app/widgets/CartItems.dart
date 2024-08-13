import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartstore_home/app/shared/theme.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

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
              Checkbox(
                activeColor: emerald,
                value: true,
                onChanged: (value) {},
              ),
              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(right: 15, left: 10),
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
                      "Name of Product",
                      style: medium.copyWith(fontSize: 16),
                    ),
                    Text(
                      "Category Name",
                      style: regular.copyWith(fontSize: 12),
                    ),
                    Text(
                      "Rp. 3.999.999",
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
                      Icons.delete,
                      color: emerald,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Color(0xFFF7F8FA),
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            CupertinoIcons.minus,
                            size: 16,
                            color: emerald,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "1",
                          style: regular.copyWith(fontSize: 15),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFF7F8FA),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            CupertinoIcons.plus,
                            size: 16,
                            color: emerald,
                          ),
                        )
                      ],
                    )
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
