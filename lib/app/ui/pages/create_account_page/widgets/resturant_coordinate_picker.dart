import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/controllers/create_account_controller.dart';
import 'package:location/location.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/app_colors.dart';

class ResturantCoordinatesPicker extends StatefulWidget {
  const ResturantCoordinatesPicker({Key? key}) : super(key: key);
  @override
  State<ResturantCoordinatesPicker> createState() => _ResturantCoordinatesPickerState();
}

class _ResturantCoordinatesPickerState extends State<ResturantCoordinatesPicker> {
  var isCurrentLocationFound = false;
  LatLng? resturantCoordinates;
  LatLng? currentLatLng;
  CameraPosition? _cameraPosition;
  Marker? marker;
  final _createAccountController = Get.find<CreateAccountController>();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    if (_createAccountController.resturantCoordinates != null) {
      marker = Marker(
        markerId: const MarkerId('resturant_coordinates'),
        position: _createAccountController.resturantCoordinates!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isCurrentLocationFound) {
      return SizedBox(
        height: 100.h,
        width: 100.w,
        child: GetBuilder<CreateAccountController>(
          initState: (_) {},
          builder: (controller) {
            return Stack(
              children: [
                Positioned.fill(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      zoom: 15.5,
                      target: LatLng(currentLatLng!.latitude, currentLatLng!.longitude),
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6),
                    onCameraMove: (cameraPos) {
                      _cameraPosition = cameraPos;
                    },
                    markers: {if (marker != null) marker!},
                  ),
                ),
                const Positioned.fill(
                  child: _MiddleScreenLocationIcon(),
                ),
                Positioned(
                  top: 8.h,
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: context.theme.colorScheme.primary,
                    child: BackButton(
                      color: context.theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: TextButton(
                    onPressed: () {
                      LatLng target;
                      if (_cameraPosition == null) {
                        target = LatLng(currentLatLng!.latitude, currentLatLng!.longitude);
                      } else {
                        target = _cameraPosition!.target;
                      }
                      controller.resturantCoordinates = target;
                      controller.coordinatedController.text = "${target.latitude}, ${target.longitude}";
                      setState(() {
                        marker = Marker(
                          markerId: const MarkerId("Your Resturant"),
                          position: target,
                          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
                        );
                      });
                    },
                    child: const Text("Set Position"),
                  ),
                ),
              ],
            );
          },
        ),
      );
    }
    return Center(
      child: SpinKitCircle(
        color: AppColors(context).primary,
      ),
    );
  }

  void _getCurrentLocation() async {
    final location = Location();
    var status = await location.hasPermission();
    if (status != PermissionStatus.granted) {
      Get.back();
      Fluttertoast.showToast(
        msg: "Please enable location permission",
        backgroundColor: AppColors(context).errorDark,
      );
      return;
    }
    location.getLocation().then((value) {
      setState(() {
        isCurrentLocationFound = true;
        currentLatLng = LatLng(value.latitude!, value.longitude!);
      });
    });
  }
}

class _MiddleScreenLocationIcon extends StatelessWidget {
  const _MiddleScreenLocationIcon({Key? key, this.size = 30}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size * 2,
      width: size * 2,
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              child: Icon(
                Icons.location_on,
                size: size,
                color: AppColors(context).primary,
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
