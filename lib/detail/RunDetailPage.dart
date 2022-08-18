import 'package:flutter/material.dart';
import 'dart:async';

import 'package:permission_handler/permission_handler.dart';
import 'package:pedometer/pedometer.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'Top.dart';
import 'Run.dart';
import 'CenterDetail.dart';
import 'Footer.dart';
import 'GaugePart.dart';

// String formatDate(DateTime d) {
//   return d.toString().substring(0, 19);
// }

class RunDetail extends StatefulWidget {
  Map selectedItem;
  // void changeUserInfo;
  RunDetail({
    Key? key,
    required this.selectedItem,
    // required this.changeUserInfo,
  }) : super(key: key);

  @override
  State<RunDetail> createState() => _RunDetailState();
}

class _RunDetailState extends State<RunDetail> {
  Timer? timer; // 정식 타이머

  Position? _position;

  int time = 0; // 시간
  double meter = 0; // 총 이동거리
  double meterTemp = 0; // 순삭 이동거리
  double meterGauge = 0; // 게이지에 나타날 수치

  bool _flag = false; // play 버튼
  double speedInMps = 0; // 현재 스피드
  String _status = '?'; // 현재 걷고 있는 상태
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

  void _startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        // time = time + 1;
        setState(() {
          tempTime++;
          time++;
          energyGaugeValue--;
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
    }

    if (keyGaugeValue >= 10) {
      setState(() {
        keyGaugeValue = 0;
        keyCount++;
      });
    }
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _getPositionSubscription =
        Geolocator.getPositionStream().listen((position) {
      if (_status == 'walking') {
        meterTemp = (tempTime * double.parse(speedInMps.toStringAsFixed(2)));

        setState(() {
          speedInMps = position.speed;
          tempTime = 0;
          meterTemp;
          meter += meterTemp;
          meterGauge += meterTemp;
          boxGaugeValue += meterTemp * 1.5;
          keyGaugeValue += meterTemp * 1.1;
        });

        checkMeter();
        checkMeterGauge();
      } else {
        setState(() {
          speedInMps = 0.0;
          tempTime = 0;
          // meter = (5 * double.parse(speedInMps.toStringAsFixed(2)));
        });
      }
    });

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
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }

    // _getPositionSubscription.cancel();

    super.dispose();
  }

  void onStepCount(StepCount event) {
    if (_flag) {
      setState(() {
        // _steps = event.steps.toString();
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
          onPressed: () =>
              // Navigator.pop(context, widget.changeUserInfo({"mater": 0, "key": 0, "box": 0})),
              // Navigator.pop(context, {"mater": 0, "key": 0, "box": 0}),
              Navigator.pop(context, 5),
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
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Top(
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

  void play() {
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
      _startTimer();
      _getCurrentLocation();
    }
  }
}
