import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartstore_home/app/modules/cart_page/views/cart_page_view.dart';
import 'package:smartstore_home/app/modules/home/views/home_view.dart';
import 'package:smartstore_home/app/modules/wishlist_page/views/wishlist_page_view.dart';
import 'package:smartstore_home/app/routes/app_pages.dart';
import 'package:smartstore_home/app/widgets/ProfileMenu.dart';
import 'package:smartstore_home/app/widgets/ProfilePic.dart';

import '../controllers/profile_user_page_controller.dart';

class ProfileUserPageView extends GetView<ProfileUserPageController> {
  const ProfileUserPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    


    return Scaffold(
        appBar: AppBar(
            // title: const Text('Profile'),
            // centerTitle: true,
            ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const ProfilePic(),
              const SizedBox(
                height: 20,
              ),
              ProfileMenu(
                text: 'My Profile',
                icon: CupertinoIcons.person,
                press: () {
                  Get.offAllNamed(Routes.PROFILE_PAGE);
                },
              ),
              ProfileMenu(
                text: 'Wishlist',
                icon: Icons.favorite,
                press: () {},
              ),
              ProfileMenu(
                text: 'Cart',
                icon: CupertinoIcons.cart,
                press: () {},
              ),
              ProfileMenu(
                text: 'Sign Out',
                icon: Icons.logout,
                press: () {
                  controller.logout();
                },
              ),
            ],
          ),
        )
        
        ,
        );
  }
}
