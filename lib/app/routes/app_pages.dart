import 'package:get/get.dart';

import '../middlewares/auth_middleware.dart';
import '../modules/cart_page/bindings/cart_page_binding.dart';
import '../modules/cart_page/views/cart_page_view.dart';
import '../modules/detail_product/bindings/detail_product_binding.dart';
import '../modules/detail_product/views/detail_product_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile-page/bindings/profile_page_binding.dart';
import '../modules/profile-page/views/profile_page_view.dart';
import '../modules/profile_user_page/bindings/profile_user_page_binding.dart';
import '../modules/profile_user_page/views/profile_user_page_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/wishlist_page/bindings/wishlist_page_binding.dart';
import '../modules/wishlist_page/views/wishlist_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
        name: _Paths.DETAIL_PRODUCT,
        page: () => DetailProductView(),
        binding: DetailProductBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.CART_PAGE,
        page: () => const CartPageView(),
        binding: CartPageBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.WISHLIST_PAGE,
        page: () => WishlistPageView(),
        binding: WishlistPageBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
      name: _Paths.PROFILE_USER_PAGE,
      page: () => const ProfileUserPageView(),
      binding: ProfileUserPageBinding(),
    ),
    GetPage(
        name: _Paths.PROFILE_PAGE,
        page: () => const ProfilePageView(),
        binding: ProfilePageBinding(),
        middlewares: [AuthMiddleware()]),
  ];
}
