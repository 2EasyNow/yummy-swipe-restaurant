import 'package:get/get.dart';

import 'package:intelligent_food_delivery/app/modules/categories/bindings/categories_binding.dart';
import 'package:intelligent_food_delivery/app/modules/categories/sub_modules/category_food_list/bindings/category_food_list_binding.dart';
import 'package:intelligent_food_delivery/app/modules/categories/sub_modules/category_food_list/views/category_food_list_view.dart';
import 'package:intelligent_food_delivery/app/modules/categories/views/categories_view.dart';
import 'package:intelligent_food_delivery/app/modules/food/bindings/food_binding.dart';
import 'package:intelligent_food_delivery/app/modules/food/views/food_view.dart';
import 'package:intelligent_food_delivery/app/modules/getting_started/bindings/getting_started_binding.dart';
import 'package:intelligent_food_delivery/app/modules/getting_started/views/getting_started_view.dart';
import 'package:intelligent_food_delivery/app/modules/home/bindings/home_binding.dart';
import 'package:intelligent_food_delivery/app/modules/home/views/home_view.dart';
import 'package:intelligent_food_delivery/app/modules/login/bindings/login_binding.dart';
import 'package:intelligent_food_delivery/app/modules/login/views/login_view.dart';
import 'package:intelligent_food_delivery/app/modules/on_boarding/bindings/on_boarding_binding.dart';
import 'package:intelligent_food_delivery/app/modules/on_boarding/views/on_boarding_view.dart';
import 'package:intelligent_food_delivery/app/modules/resturant_profile/bindings/resturant_profile_binding.dart';
import 'package:intelligent_food_delivery/app/modules/resturant_profile/views/resturant_profile_view.dart';
import 'package:intelligent_food_delivery/app/modules/setting/bindings/setting_binding.dart';
import 'package:intelligent_food_delivery/app/modules/setting/views/setting_view.dart';
import 'package:intelligent_food_delivery/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:intelligent_food_delivery/app/modules/sign_up/views/sign_up_view.dart';
import 'package:intelligent_food_delivery/app/modules/splash/bindings/splash_binding.dart';
import 'package:intelligent_food_delivery/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.GETTING_STARTED,
      page: () => GettingStartedView(),
      binding: GettingStartedBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
        name: _Paths.CATEGORIES,
        page: () => CategoriesView(),
        binding: CategoriesBinding(),
        children: [
          GetPage(
            name: _Paths.CATEGORY_FOOD_LIST,
            page: () => CategoryFoodListView(),
            binding: CategoryFoodListBinding(),
            transition: Transition.rightToLeft,
          ),
        ]),
    GetPage(
      name: _Paths.FOOD,
      page: () => FoodView(),
      binding: FoodBinding(),
    ),
    GetPage(
      name: _Paths.RESTURANT_PROFILE,
      page: () => ResturantProfileView(),
      binding: ResturantProfileBinding(),
    ),
  ];
}
