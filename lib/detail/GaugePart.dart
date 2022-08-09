import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugePart extends StatelessWidget {
  int keyCount;
  int boxCount;
  double keyGaugeValue;
  double boxGaugeValue;

  GaugePart({
    Key? key,
    required this.keyCount,
    required this.boxCount,
    required this.keyGaugeValue,
    required this.boxGaugeValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  debugPrint("debugPrint");
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[700],
                ),
                child: const Text("러너스하이 발동 버튼"),
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint("debugPrint");
                },
                child: const Text("러너스하이 예약 버튼"),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SfLinearGauge(
                  minimum: 0,
                  maximum: 10,
                  // minorTicksPerInterval: 0,
                  // useRangeColorForAxis: true,
                  showLabels: false,
                  showTicks: false,
                  animateAxis: true,
                  axisTrackStyle: const LinearAxisTrackStyle(thickness: 1),
                  // ignore: prefer_const_literals_to_create_immutables
                  ranges: <LinearGaugeRange>[
                    LinearGaugeRange(
                      startValue: 0,
                      endValue: boxGaugeValue,
                      position: LinearElementPosition.outside,
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
                // const Icons
                const Icon(
                  Icons.home_repair_service,
                  color: Colors.black,
                ),
                Text("X $boxCount"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SfLinearGauge(
                  animateAxis: true,
                  animateRange: true,
                  animationDuration: 2000,
                  minimum: 0,
                  maximum: 10,
                  showLabels: false,
                  showTicks: false,
                  axisTrackStyle: const LinearAxisTrackStyle(thickness: 1),
                  // ignore: prefer_const_literals_to_create_immutables
                  ranges: <LinearGaugeRange>[
                    LinearGaugeRange(
                      startValue: 0,
                      endValue: keyGaugeValue,
                      position: LinearElementPosition.outside,
                      color: Color(0xffF45656),
                    ),
                  ],
                ),
                // const Icons
                const Icon(
                  Icons.key,
                  color: Colors.black,
                ),
                Text("X $keyCount"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
