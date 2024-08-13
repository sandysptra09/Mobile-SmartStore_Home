import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartstore_home/app/shared/theme.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('ProfilePageView'),
        //   centerTitle: true,
        // ),
        body: SafeArea(
            child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              height: 155,
              width: 115,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/profile_pic.webp'),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: const BorderSide(color: Colors.white),
                            ),
                            backgroundColor: const Color(0xFFF5F6F9),
                          ),
                          onPressed: () {},
                          child:
                              Image(image: AssetImage('images/on_status.png')),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Container(
            child: Obx(() => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: regular.copyWith(fontSize: 14),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        top: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        left: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        right: BorderSide(
                                            color: emerald.withOpacity(0.7))),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.user['username'],
                                    style: medium.copyWith(fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Firstname',
                                style: regular.copyWith(fontSize: 14),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        top: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        left: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        right: BorderSide(
                                            color: emerald.withOpacity(0.7))),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.user['firstname'],
                                    style: medium.copyWith(fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lastname',
                                style: regular.copyWith(fontSize: 14),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        top: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        left: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        right: BorderSide(
                                            color: emerald.withOpacity(0.7))),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.user['lastname'],
                                    style: medium.copyWith(fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone',
                                style: regular.copyWith(fontSize: 14),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        top: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        left: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        right: BorderSide(
                                            color: emerald.withOpacity(0.7))),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.user['phone'],
                                    style: medium.copyWith(fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Address',
                                style: regular.copyWith(fontSize: 14),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                    top: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                    left: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                    right: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.user['address1'],
                                    style: medium.copyWith(fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Province',
                                style: regular.copyWith(fontSize: 14),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                    top: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                    left: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                    right: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.user['province'],
                                    style: medium.copyWith(fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'City',
                                style: regular.copyWith(fontSize: 14),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                    top: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                    left: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                    right: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.user['city'],
                                    style: medium.copyWith(fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Postcode',
                                style: regular.copyWith(fontSize: 14),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                    top: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                    left: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                    right: BorderSide(
                                        color: emerald.withOpacity(0.7)),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.user['post_code'].toString(),
                                    style: medium.copyWith(fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: regular.copyWith(fontSize: 14),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        top: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        left: BorderSide(
                                            color: emerald.withOpacity(0.7)),
                                        right: BorderSide(
                                            color: emerald.withOpacity(0.7))),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.user['email'],
                                    style: medium.copyWith(fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
          )
        ],
      ),
    )));
  }
}
