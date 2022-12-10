import '../models/restaurant.dart';

abstract class RestaurantDataSource {
  Future<void> createRestaurant(Restaurant user);
  Future<Restaurant?> getRestaurant(String uid);
  Future<Restaurant?> getRestaurantByPhoneNumber(String phone);
  Future<Restaurant> update(Restaurant user);
}
