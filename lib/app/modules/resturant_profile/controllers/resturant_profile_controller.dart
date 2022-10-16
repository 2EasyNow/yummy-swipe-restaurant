import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/common/widgets/bottom_sheets.dart';
import 'package:intelligent_food_delivery/app/common/widgets/snackbars.dart';
import 'package:intelligent_food_delivery/app/core/controllers/authentication.controller.dart';
import 'package:intelligent_food_delivery/app/data/resturant_owner/models/resturant_owner.dart';
import 'package:intelligent_food_delivery/app/domain/app_user/use_cases/resturant_owner_use_case.dart';

class ResturantProfileController extends GetxController {
  final _resturantOwnerUseCase = Get.find<ResturantOwnerUseCase>();

  final formKey = GlobalKey<FormState>();
  late LatLng resturantCoordinates;

  ResturantOwner? get currentUser => _resturantOwnerUseCase.currentUser;
  final resturantOwnerNameController = TextEditingController();
  final resturantNameController = TextEditingController();
  final resturantAddressController = TextEditingController();
  final resturantPhoneNumberController = TextEditingController();
  final resturantCoordinatesController = TextEditingController();

  final openingTimeController = TextEditingController();
  final closingTimeController = TextEditingController();

  List<String> resturantTags = [];
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
    final number = resturantPhoneNumberController.text.replaceAll('-', '');
    return '+923$number';
  }

  @override
  void onInit() {
    super.onInit();
    if (currentUser == null) {
      Get.find<AuthenticationController>().logOut();
    }
    resturantOwnerNameController.text = currentUser!.name;
    resturantNameController.text = currentUser!.resturantName;
    resturantAddressController.text = currentUser!.address;
    final unformatedPhoneNumber = currentUser!.phone.substring(4);
    resturantPhoneNumberController.text =
        unformatedPhoneNumber.replaceFirst(unformatedPhoneNumber.substring(0, 2), '${unformatedPhoneNumber.substring(0, 2)}-');
    resturantCoordinatesController.text = "${currentUser!.coordinates.latitude}, ${currentUser!.coordinates.longitude}";
    resturantCoordinates = currentUser!.coordinates;
    openingTime = currentUser!.openingTime;
    closingTime = currentUser!.closingTime;
    resturantTags = currentUser!.resturantTags;
  }

  updateResturantInfo(context) async {
    if (!formKey.currentState!.validate()) return;
    showLoadingBottomSheet(context, title: 'Updating Resturant Info');
    await _resturantOwnerUseCase.updateOwner(
      name: resturantOwnerNameController.text,
      resturantName: resturantNameController.text,
      address: resturantAddressController.text,
      phone: phoneNumber!,
      coordinates: resturantCoordinates,
      resturantTags: resturantTags,
      openingTime: _openingTime!,
      closingTime: _closingTime!,
    );
    if (Get.isBottomSheetOpen!) {
      Get.back();
    }
    showSuccessSnackbar('Update Returant Info', 'Successfully Updated the resturant info');
    update();
  }
}
