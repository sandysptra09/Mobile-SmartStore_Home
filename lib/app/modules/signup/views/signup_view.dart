import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartstore_home/app/routes/app_pages.dart';
import 'package:smartstore_home/app/shared/theme.dart';
import 'package:smartstore_home/app/widgets/ButtonWidgets.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);

  SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Your Account',
                  style: semibold.copyWith(
                    fontSize: 18,
                    color: darkerBlack,
                  ),
                ),
                Text(
                  'Create your account to start a journey',
                  style: regular.copyWith(
                    fontSize: 12,
                    color: grey,
                  ),
                )
              ],
            ),
          ),
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 240,
              width: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/signup.png'),
                  scale: 1,
                ),
              ),
            ),
            // const SizedBox(
            //   height: 15,
            // ),
            Padding(
                padding: EdgeInsets.all(30),
                child: Form(
                  key: signupController.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: semibold.copyWith(fontSize: 12),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 40,
                        // width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: lineStroke),
                        ),
                        child: TextFormField(
                          onChanged: signupController.onUsernameChanged,
                          autocorrect: false,
                          style:
                              regular.copyWith(fontSize: 12, color: darkGrey),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                            hintText: 'Username',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input your username';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Email',
                        style: semibold.copyWith(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: lineStroke),
                        ),
                        child: TextFormField(
                          autocorrect: false,
                          onChanged: signupController.onEmailChanged,
                          style: regular.copyWith(
                            fontSize: 12,
                            color: darkGrey,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                            hintText: 'Enter Your Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input your email';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Password',
                        style: semibold.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: lineStroke),
                        ),
                        child: TextFormField(
                          onChanged: signupController.onPasswordChanged,
                          autocorrect: false,
                          obscureText: true,
                          style: regular.copyWith(
                            fontSize: 12,
                            color: darkGrey,
                          ),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 0, 16, 10),
                              hintText: 'Enter Your Password'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input your password';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                          onTap: () {
                            if (signupController.formKey.currentState!
                                .validate()) {
                              signupController.register();
                            }
                          },
                          child: const ButtonWidgets(
                            label: 'Create Account',
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have a account? ',
                            style: regular.copyWith(
                              fontSize: 12,
                              color: grey,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(Routes.SIGNIN);
                              print('sign in tapped');
                            },
                            child: Text(
                              'Sign In',
                              style: regular.copyWith(
                                fontSize: 10,
                                color: emerald,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
