import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartstore_home/app/routes/app_pages.dart';
import 'package:smartstore_home/app/shared/theme.dart';
import 'package:smartstore_home/app/widgets/ButtonWidgets.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  SigninView({Key? key}) : super(key: key);

  SigninController signinController = Get.put(SigninController());

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
                  'Welcome Back',
                  style: semibold.copyWith(
                    fontSize: 18,
                    color: darkerBlack,
                  ),
                ),
                Text(
                  'Login to continue your journey',
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
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 260,
              width: 260,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/signin.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: signinController.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
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
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: lineStroke,
                          ),
                        ),
                        child: TextFormField(
                          onChanged: signinController.onUsernameChanged,
                          autocorrect: false,
                          style: regular.copyWith(
                            fontSize: 12,
                            color: darkGrey,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                            hintText: 'Enter Your Username',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
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
                          border: Border.all(
                            color: lineStroke,
                          ),
                        ),
                        child: TextFormField(
                          onChanged: signinController.onPasswordChanged,
                          autocorrect: false,
                          obscureText: true,
                          style: regular.copyWith(
                            fontSize: 12,
                            color: darkGrey,
                          ),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.fromLTRB(16, 0, 16, 10),
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
                        height: 20,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     GestureDetector(
                      //       onTap: () {
                      //         print('forget tapped');
                      //         Get.offAllNamed(Routes.PROFILE_USER_PAGE);
                      //       },
                      //       child: Text(
                      //         'Forget Password ?',
                      //         style: regular.copyWith(
                      //           fontSize: 10,
                      //           color: emerald,
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (signinController.formKey.currentState!
                              .validate()) {
                            if (signinController.username.value.isNotEmpty &&
                                signinController.password.value.isNotEmpty) {
                              signinController.login();
                            }
                          } else {
                            Get.snackbar('Error',
                                'Username and Password cannot be empty!');
                          }
                        },
                        child: const ButtonWidgets(
                          label: 'Login',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have a account? ',
                            style: regular.copyWith(
                              fontSize: 10,
                              color: grey,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(Routes.SIGNUP);
                            },
                            child: Text(
                              'Sign Up',
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
                )),
          ],
        ));
  }
}
