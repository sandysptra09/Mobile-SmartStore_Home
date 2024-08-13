import 'package:get/get.dart';

import '../controllers/profile_user_page_controller.dart';

class ProfileUserPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUserPageController>(
      () => ProfileUserPageController(),
    );
  }
}
