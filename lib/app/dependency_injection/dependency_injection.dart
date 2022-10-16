import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/data/resturant_owner/data_sources/resturant_owner_data_source.dart';
import 'package:intelligent_food_delivery/app/domain/app_user/repositories/resturant_owner_repository.dart';
import '../common/theme/theme_controller.dart';
import '../core/core.dart';
import '../data/food_category/data_sources/food_category_data_source.dart';
import '../data/food_category/data_sources/food_category_remote_data_source.dart';
import '../data/food_category/repository/food_category_repository_impl.dart';
import '../data/food_item/data_sources/food_item_data_source.dart';
import '../data/food_item/data_sources/food_item_remote_data_source.dart';
import '../data/food_item/repository/food_item_repository_impl.dart';
import '../data/resturant_owner/data_sources/resturant_owner_remote_data_source.dart';
import '../data/resturant_owner/repositories/resturant_owner_repository_impl.dart';
import '../domain/app_settings/usecase/app_setttings_use_case.dart';
import '../domain/app_user/use_cases/resturant_owner_use_case.dart';
import '../domain/food_category/repositories/food_category_repository.dart';
import '../domain/food_category/use_cases/food_category_use_case.dart';
import '../domain/food_item/repositories/food_item_repository.dart';
import '../domain/food_item/use_cases/food_item_use_case.dart';

class DependecyInjection {
  static void init() {
    // Get.put<NavigationController>(NavigationController());
    // Get.put<MainController>(MainController());
    Get.put<ThemeController>(ThemeController());
    Get.put<AuthenticationController>(AuthenticationController(), permanent: true);
    // Get.put<ResturantOwnerController>(ResturantOwnerController(), permanent: true);
    Get.put(AppSettingsUseCase(), permanent: true);
    _setupResturantOwnerDependency();
    _setupFoodCategoryDependency();
    _setupFoodItemDependency();
  }
}

_setupResturantOwnerDependency() {
  Get.put<ResturantOwnerDataSource>(
    ResturantOwnerRemoteDataSource(),
    permanent: true,
  );
  Get.put<ResturantOwnerRepository>(
    ResturantOwnerRepositoryImpl(Get.find()),
    permanent: true,
  );
  Get.put<ResturantOwnerUseCase>(
    ResturantOwnerUseCase(Get.find()),
    permanent: true,
  );
}

_setupFoodCategoryDependency() {
  Get.lazyPut<FoodCategoryDataSource>(
    () => FoodCategoryRemoteDataSource(),
    fenix: true,
  );
  Get.lazyPut<FoodCategoryRepository>(
    () => FoodCategoryRepositoryImpl(Get.find()),
    fenix: true,
  );
  Get.lazyPut<FoodCategoryUseCase>(
    () => FoodCategoryUseCase(Get.find()),
    fenix: true,
  );
}

_setupFoodItemDependency() {
  Get.lazyPut<FoodItemDataSource>(
    () => FoodItemRemoteDataSource(),
    fenix: true,
  );
  Get.lazyPut<FoodItemRepository>(
    () => FoodItemRepositoryImpl(Get.find()),
    fenix: true,
  );
  Get.lazyPut<FoodItemUseCase>(
    () => FoodItemUseCase(Get.find()),
    fenix: true,
  );
}
