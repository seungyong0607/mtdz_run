import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static final LatLng companyLatLng = LatLng(37.5233273, 126.921252);

  static final CameraPosition initialPosition = CameraPosition(
    target: companyLatLng,
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MTDZ RUN',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _CustomGoogleMap(initialPosition: initialPosition),
          _RunButton(),
        ],
      ),
    );
  }

  checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      return "위치 서비스를 활성화 해주세요.";
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission();
  }
}

class _CustomGoogleMap extends StatelessWidget {
  final CameraPosition initialPosition;
  const _CustomGoogleMap({required this.initialPosition, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialPosition,
      ),
    );
  }
}

class _RunButton extends StatelessWidget {
  const _RunButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 1,
      child: Text("MTDZ RUN"),
    );
  }
}
