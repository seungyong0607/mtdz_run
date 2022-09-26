import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:get/get.dart';
// import 'package:mtdz_run/controller/UserController.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pedometer/pedometer.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:get_it/get_it.dart';
import 'package:mtdz_run/database/drift_database.dart';
import 'package:drift/drift.dart' show Value;

import 'RunDetailTopPart.dart';
import 'Run.dart';
import 'CenterDetail.dart';
import 'Footer.dart';
import 'GaugePart.dart';

// String formatDate(DateTime d) {
//   return d.toString().substring(0, 19);
// }

class RunDetail extends StatefulWidget {
  Map selectedItem;
  RunDetail({
    Key? key,
    required this.selectedItem,
  }) : super(key: key);

  @override
  State<RunDetail> createState() => _RunDetailState();
}

class _RunDetailState extends State<RunDetail> {
  late int tableId;

  // final Controller controller = Get.put(Controller());
  Timer? timer; // 정식 타이머

  Position? _position;

  int time = 0; // 시간
  double meter = 0; // 총 이동거리
  double meterTemp = 0; // 순삭 이동거리
  double meterGauge = 0; // 게이지에 나타날 수치

  bool _flag = false; // play 버튼
  double speedInMps = 0; // 현재 스피드
  String _status = ''; // 현재 걷고 있는 상태
  int _steps = 0; // 총 발걸음
  int adrenaline = 0; // 게이지가 차면 +1 적립
  int tempTime = 0; // 다음 위치 발생시까지 초를 기록

  double boxGaugeValue = 0;
  double keyGaugeValue = 0;
  double energyGaugeValue = 10;

  int energyValue = 10;
  int keyCount = 0;
  int boxCount = 0;

  static const int ENERGY_COUNT = 10;
  static const int GAUGE_COUNT_VALUE = 10;

  late StreamSubscription _getPositionSubscription;
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0.0,
        titleSpacing: 10,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            const ClipRect(
              child: Icon(
                Icons.run_circle,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              widget.selectedItem['name'].toString(),
              // _status,
              style: const TextStyle(color: Colors.white),
            ),
            Text(_status),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          RunDetailTopPart(
            meterGauge: meterGauge,
            meter: meter,
            meterTemp: meterTemp,
            adrenaline: adrenaline,
            gaugeCountValue: GAUGE_COUNT_VALUE,
            energyCount: ENERGY_COUNT,
            energyGaugeValue: energyGaugeValue,
            energyValue: energyValue,
          ),
          const SizedBox(height: 50),
          CenterDetail(
            selectedItem: widget.selectedItem,
            time: time.toString(),
            speedInMps: speedInMps.toStringAsFixed(2).toString(),
            steps: _steps.toString(),
          ),
          const SizedBox(height: 10),
          Run(
            meter: meter,
            meterTemp: meterTemp,
            status: _status,
          ),
          GaugePart(
            boxCount: boxCount,
            keyCount: keyCount,
            boxGaugeValue: boxGaugeValue,
            keyGaugeValue: keyGaugeValue,
          ),
          const SizedBox(
            height: 50,
          ),
          Footer(
            play: play,
            flag: _flag,
          ),
        ],
      ),
    );
  }

  void _startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        // time = time + 1;
        energyGaugeValue--;

        if (energyGaugeValue <= -1) {
          energyGaugeValue = 10;
        }
        setState(() {
          tempTime++;
          time++;
          energyGaugeValue;
        });

        if (time % 10 == 0) {
          setState(() {
            energyGaugeValue = 10;
            energyValue--;
          });

          if (energyValue <= 0) {
            setState(() {
              energyValue = 10;
            });
          }
          // 30초마다 에너지 소실
        }

        // debugPrint("+++++++++++++ $time");
      },
    );
  }

  void checkMeter() {
    if (meterGauge >= GAUGE_COUNT_VALUE) {
      setState(() {
        meterGauge = meterGauge - GAUGE_COUNT_VALUE;
        adrenaline++; // 에너지 소비를 위한 아드레날린(?)
      });
    }
  }

  void checkMeterGauge() {
    if (boxGaugeValue >= 10) {
      setState(() {
        boxGaugeValue = 0;
        boxCount++;
      });

      // controller.boxCountUpdate();
    }

    if (keyGaugeValue >= 10) {
      setState(() {
        keyGaugeValue = 0;
        keyCount++;
      });

      // controller.keyCountUpdate();
    }
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // final location = await Geolocator.getCurrentPosition();
    _getPositionSubscription = Geolocator.getPositionStream().listen(
      (position) {
        GetIt.I<LocalDatabase>().updateRecord(
          MovementsCompanion(
            id: Value(tableId),
            lat: Value(position.latitude.toString()),
            long: Value(position.longitude.toString()),
            speed: Value(
              position.speed.toStringAsFixed(2),
            ),
          ),
        );

        if (_status == 'walking') {
          meterTemp = (tempTime * double.parse(speedInMps.toStringAsFixed(2)));

          setState(() {
            speedInMps = position.speed;
            tempTime = 0;
            meterTemp;
            meter += meterTemp;
            meterGauge += meterTemp;
            boxGaugeValue += meterTemp * 2;
            keyGaugeValue += meterTemp * 3;
          });

          // controller.meterUpdate(meterTemp);

          checkMeter();
          checkMeterGauge();
        } else {
          setState(() {
            speedInMps = 0.0;
            tempTime = 0;
            // meter = (5 * double.parse(speedInMps.toStringAsFixed(2)));
          });
        }
      },
    );

    setState(() {
      _position = position;
    });
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    // LocationPermission permission = await Geolocator.checkPermission();
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('error');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _determinePosition();
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }

    // _inputStore();
    super.dispose();
  }

  void onStepCount(StepCount event) {
    if (_flag) {
      setState(() {
        _steps;
      });

      _steps++;
    }
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
  }

  void onStepCountError(error) {
    // setState(() {
    //   _steps = 'Step Count not available';
    // });
  }

  void initPlatformState() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _pedestrianStatusStream
          .listen(onPedestrianStatusChanged)
          .onError(onPedestrianStatusError);

      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);
    }

    if (!mounted) return;
  }

  void play() async {
    setState(() {
      _flag = !_flag;
    });

    if (!_flag) {
      _getPositionSubscription.cancel();

      if (timer != null) {
        timer!.cancel();
      }
      timer = null;

      setState(() {
        speedInMps = 0.0;
        time = 0;
        _steps = 0;
      });
    } else {
      DateTime focusedDay = DateTime.now();

      tableId = await GetIt.I<LocalDatabase>().createRecord(
        RecordsCompanion(
          startTime: Value(focusedDay),
          // endTime: Value(focusedDay),
          // elaspedTime: Value(focusedDay),
          // check: Value(true),
        ),
      );

      _startTimer();
      _getCurrentLocation();
    }
  }
}
