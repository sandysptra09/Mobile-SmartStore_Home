import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smartstore_home/app/modules/home/views/home_view.dart';
import 'package:smartstore_home/app/shared/theme.dart';

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: GNav(
          rippleColor: Colors.white,
          hoverColor: emerald,
          haptic: true,
          tabBorderRadius: 15,
          // tabActiveBorder: Border.all(color: Colors.black, width: 1),
          // tabBorder: Border.all(color: Colors.grey, width: 1),
          // tab button shadow
          curve: Curves.easeOutExpo, // tab animation curves
          duration: const Duration(milliseconds: 900), // tab animation duration
          gap: 8,
          color: darkGrey,
          activeColor: emerald,
          iconSize: 24,
          tabBackgroundColor: emerald.withOpacity(0.1),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tabs: [
            const GButton(
              icon: CupertinoIcons.home,
              text: 'Home',
            ),
            const GButton(
              icon: Icons.favorite,
              text: 'Whislist',
            ),
            const GButton(
              icon: CupertinoIcons.cart,
              text: 'Cart',
            ),
            const GButton(
              icon: CupertinoIcons.person,
              text: 'Profile',
            )
          ]),
    );
  }
}
