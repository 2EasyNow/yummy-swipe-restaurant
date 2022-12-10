import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/common/widgets/bottom_sheets.dart';
import 'package:intelligent_food_delivery/app/common/widgets/snackbars.dart';
import 'package:intelligent_food_delivery/app/core/controllers/authentication.controller.dart';
import 'package:intelligent_food_delivery/app/data/restaurant/models/restaurant.dart';

import '../../../domain/restaurant/use_cases/resturant_use_case.dart';

class RestaurantProfileController extends GetxController {
  final _restaurantOwnerUseCase = Get.find<RestaurantUseCase>();

  final formKey = GlobalKey<FormState>();
  late LatLng restaurantCoordinates;

  Restaurant? get currentUser => _restaurantOwnerUseCase.currentUser;
  final restaurantOwnerNameController = TextEditingController();
  final restaurantNameController = TextEditingController();
  final restaurantAddressController = TextEditingController();
  final restaurantPhoneNumberController = TextEditingController();
  final restaurantCoordinatesController = TextEditingController();
  final averageOrderTimeController = TextEditingController();

  final openingTimeController = TextEditingController();
  final closingTimeController = TextEditingController();

  List<String> restaurantTags = [];
  TimeOfDay? _openingTime, _closingTime;
  final coordinatedScopeNode = FocusScopeNode();
  final phoneNumberScopeNode = FocusScopeNode();

  set openingTime(val) {
    _openingTime = val;
    openingTimeController.text = val.format(Get.context!);
  }

  set closingTime(val) {
    _closingTime = val;
    closingTimeController.text = val.format(Get.context!);
  }

  String? get phoneNumber {
    final number = restaurantPhoneNumberController.text.replaceAll('-', '');
    return '+923$number';
  }

  @override
  void onInit() {
    super.onInit();
    if (currentUser == null) {
      Get.find<AuthenticationController>().logOut();
    }
    restaurantOwnerNameController.text = currentUser!.ownerName;
    restaurantNameController.text = currentUser!.name;
    restaurantAddressController.text = currentUser!.address;
    final unformatedPhoneNumber = currentUser!.phone.substring(4);
    restaurantPhoneNumberController.text =
        unformatedPhoneNumber.replaceFirst(unformatedPhoneNumber.substring(0, 2), '${unformatedPhoneNumber.substring(0, 2)}-');
    restaurantCoordinatesController.text = "${currentUser!.coordinates.latitude}, ${currentUser!.coordinates.longitude}";
    restaurantCoordinates = currentUser!.coordinates;
    openingTime = currentUser!.openingTime;
    closingTime = currentUser!.closingTime;
    averageOrderTimeController.text = currentUser!.averageTimeToCompleteOrder.toString();
    restaurantTags = currentUser!.foodOfferingTypes;
  }

  updateRestaurantInfo(context) async {
    if (!formKey.currentState!.validate()) return;
    showLoadingBottomSheet(context, title: 'Updating Restaurant Info');
    await _restaurantOwnerUseCase.updateOwner(
      ownerName: restaurantOwnerNameController.text,
      name: restaurantNameController.text,
      address: restaurantAddressController.text,
      phone: phoneNumber!,
      coordinates: restaurantCoordinates,
      foodOfferingTypes: restaurantTags,
      openingTime: _openingTime!,
      closingTime: _closingTime!,
    );
    if (Get.isBottomSheetOpen!) {
      Get.back();
    }
    showSuccessSnackbar('Update Returant Info', 'Successfully Updated the restaurant info');
    update();
  }
}
