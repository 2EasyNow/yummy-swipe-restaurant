import 'package:get/get.dart';
import '../common/theme/theme_controller.dart';
import '../core/core.dart';
import '../data/food_category/data_sources/food_category_data_source.dart';
import '../data/food_category/data_sources/food_category_remote_data_source.dart';
import '../data/food_category/repository/food_category_repository_impl.dart';
import '../data/food_item/data_sources/food_item_data_source.dart';
import '../data/food_item/data_sources/food_item_remote_data_source.dart';
import '../data/food_item/repository/food_item_repository_impl.dart';
import '../data/order/data_sources/food_order_data_source.dart';
import '../data/order/data_sources/food_order_remote_data_source.dart';
import '../data/order/repository/food_order_repository_impl.dart';
import '../data/restaurant/data_sources/restaurant_data_source.dart';
import '../data/restaurant/data_sources/restaurant_remote_data_source.dart';
import '../data/restaurant/repositories/restaurant_repository_impl.dart';
import '../domain/app_settings/usecase/app_setttings_use_case.dart';
import '../domain/food_category/repositories/food_category_repository.dart';
import '../domain/food_category/use_cases/food_category_use_case.dart';
import '../domain/food_item/repositories/food_item_repository.dart';
import '../domain/food_item/use_cases/food_item_use_case.dart';
import '../domain/order/repositories/order_repository.dart';
import '../domain/order/use_cases/order_use_case.dart';
import '../domain/restaurant/repositories/restaurant_repository.dart';
import '../domain/restaurant/use_cases/resturant_use_case.dart';

class DependecyInjection {
  static void init() {
    // Get.put<NavigationController>(NavigationController());
    // Get.put<MainController>(MainController());
    Get.put<ThemeController>(ThemeController());
    Get.put<AuthenticationController>(AuthenticationController(), permanent: true);
    // Get.put<RestaurantController>(RestaurantController(), permanent: true);
    Get.put(AppSettingsUseCase(), permanent: true);
    _setupRestaurantDependency();
    _setupFoodCategoryDependency();
    _setupFoodItemDependency();
    _setupFoodOrderDependency();
  }
}

_setupRestaurantDependency() {
  Get.put<RestaurantDataSource>(
    RestaurantRemoteDataSource(),
    permanent: true,
  );
  Get.put<RestaurantRepository>(
    RestaurantRepositoryImpl(Get.find()),
    permanent: true,
  );
  Get.put<RestaurantUseCase>(
    RestaurantUseCase(Get.find()),
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

_setupFoodOrderDependency() {
  Get.put<FoodOrderDataSource>(
    FoodOrderRemoteDataSource(),
    permanent: true,
  );
  Get.put<FoodOrderRepository>(
    FoodOrderRepositoryImpl(Get.find()),
    permanent: true,
  );
  Get.put<FoodOrderUseCase>(
    FoodOrderUseCase(Get.find()),
    permanent: true,
  );
}
