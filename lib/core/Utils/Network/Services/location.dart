import 'package:flutter/cupertino.dart';

import 'package:location/location.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/exception.dart';

class LocationService {
  Location location = Location();

  Future<void> checkAndrequestLocationService() async {
    final bool isServiceEnabled0 = !await location.serviceEnabled();
    if (!isServiceEnabled0) {
      final isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        throw PermissionException(message: "Service not enabled");
      }
    }
  }

  Future<void> checkAndrequestLocationPermission() async {
    final hasPermission = await location.hasPermission();
    if (hasPermission == PermissionStatus.deniedForever) {
      throw PermissionException(message: "Permission not denied forever");
    }
    if (hasPermission == PermissionStatus.denied) {
      final hasPermissionAfterRequest = await location.requestPermission();

      if (hasPermissionAfterRequest != PermissionStatus.granted) {
        debugPrint("service denied");

        throw PermissionException(message: "Permission not granted");
      }
    }
    debugPrint("service Performed");
  }

  Future<void> updateUserLocation(
      void Function(LocationData)? onDatachange) async {
    await checkAndrequestLocationService();
    await checkAndrequestLocationPermission();
    location.changeSettings(distanceFilter: 3);
    debugPrint("location change");

    location.onLocationChanged.listen(onDatachange);
  }

  Future<LocationData> getuserLocation() async {
    await checkAndrequestLocationService();
    await checkAndrequestLocationPermission();
    try {
      final x = await location.getLocation();
      debugPrint('action done $x');
      return x;
    } on PermissionException catch (e) {
      throw PermissionException(message: e.message);
    }
  }
}
