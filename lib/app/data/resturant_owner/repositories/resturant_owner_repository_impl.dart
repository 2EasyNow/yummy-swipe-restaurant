import '../../../domain/app_user/repositories/resturant_owner_repository.dart';
import '../data_sources/resturant_owner_data_source.dart';
import '../models/resturant_owner.dart';

class ResturantOwnerRepositoryImpl implements ResturantOwnerRepository {
  final ResturantOwnerDataSource _dataSource;

  ResturantOwnerRepositoryImpl(this._dataSource);

  @override
  Future<ResturantOwner?> getUser(String uid) async {
    return await _dataSource.getResturantOwner(uid);
  }

  @override
  Future<ResturantOwner> createUser(ResturantOwner user) async {
    await _dataSource.createResturantOwner(user);
    return user;
  }

  @override
  Future<ResturantOwner> updateUser(String uid, ResturantOwner user) {
    return _dataSource.updateOwner(uid, user);
  }

  @override
  Future<ResturantOwner?> getUserByPhoneNumber(String phoneNumber) async {
    return await _dataSource.getOwnerByPhoneNumber(phoneNumber);
  }
}
