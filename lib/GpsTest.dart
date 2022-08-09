import 'package:flutter/material.dart';
import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GpsTest extends StatefulWidget {
  const GpsTest({Key? key}) : super(key: key);

  @override
  State<GpsTest> createState() => _GpsTestState();
}

class _GpsTestState extends State<GpsTest> {
  test() async {
    // var geolocator = Geolocator();
    // var options =
    // LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

    // LocationPermission permission = await Geolocator.checkPermission();

    // Geolocator.getPositionStream().listen((position) {
    //   speedInMps = position.speed; // this is your speed
    //   print(speedInMps);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocation App'),
      ),
    );
  }
}
