import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartstore_home/app/routes/app_pages.dart';
import 'package:smartstore_home/app/shared/theme.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.all(22),
        child: Row(
          children: [
            Icon(
              Icons.sort,
              size: 30,
              color: emerald,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'SmartStore Home',
                style: semibold.copyWith(
                  fontSize: 20,
                  color: emerald,
                ),
              ),
            ),
            Spacer(),
            badges.Badge(
              badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.red, padding: EdgeInsets.all(7)),
              badgeContent: Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.CART_PAGE);
                },
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 32,
                  color: emerald,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
