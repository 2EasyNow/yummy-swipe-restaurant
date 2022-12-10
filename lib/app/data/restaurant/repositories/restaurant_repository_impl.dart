import '../../../domain/restaurant/repositories/restaurant_repository.dart';
import '../data_sources/restaurant_data_source.dart';
import '../models/restaurant.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantDataSource _dataSource;

  RestaurantRepositoryImpl(this._dataSource);

  @override
  Future<Restaurant?> getUser(String uid) async {
    return await _dataSource.getRestaurant(uid);
  }

  @override
  Future<Restaurant> createUser(Restaurant user) async {
    await _dataSource.createRestaurant(user);
    return user;
  }

  @override
  Future<Restaurant> updateUser(Restaurant user) {
    return _dataSource.update(user);
  }

  @override
  Future<Restaurant?> getUserByPhoneNumber(String phoneNumber) async {
    return await _dataSource.getRestaurantByPhoneNumber(phoneNumber);
  }
}
