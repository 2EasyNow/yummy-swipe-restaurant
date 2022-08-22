import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/utils/bottom_sheets.dart';
import 'package:location/location.dart';

import '../../../../../assets/assets.gen.dart';
import '../../../../utils/utils.dart';
import '../../../global_widgets/icon_button.dart';
import '../../../global_widgets/spacers.dart';

class LocationPermissionSheet extends StatelessWidget {
  const LocationPermissionSheet({Key? key, required this.onSuccessfullyGranted}) : super(key: key);

  final Function onSuccessfullyGranted;

  getPermission() {
    Location.instance.requestPermission().then((value) {
      if (value == PermissionStatus.granted) {
        showSuccessSnackbar("Location Permission", "Successfully Granted");
        onSuccessfullyGranted();
      } else {
        showErrorSnackbar("Location Permission", "Failed to grant location permission.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Please grant location permission to use this feature."),
        const VerticalSpacer(),
        AppIconnedButton(
          onPressed: getPermission,
          text: "Grant Now",
          icon: Assets.icons.location.svg(height: 24),
        )
      ],
    );
  }
}
