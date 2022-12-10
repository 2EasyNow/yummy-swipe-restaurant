import '../../../data/restaurant/models/restaurant.dart';

abstract class RestaurantRepository {
  Future<Restaurant?> getUser(String uid);
  Future<Restaurant> createUser(Restaurant user);
  Future<Restaurant> updateUser(Restaurant user);
  Future<Restaurant?> getUserByPhoneNumber(String phoneNumber);
}
