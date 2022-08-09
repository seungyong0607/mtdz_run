import 'package:flutter/material.dart';
import 'package:mtdz_run/constant/gageuValues.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CenterDetail extends StatelessWidget {
  late String steps;
  late String speedInMps;
  late String time;
  // late String gaugeType =

  CenterDetail({
    required this.steps,
    required this.speedInMps,
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          width: 70,
          height: 180,
          child: Column(
            children: <Widget>[
              Text(
                time,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Icon(
                Icons.timer_outlined,
                color: Colors.black,
                size: 24,
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              '${speedInMps}km/h',
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 130,
              height: 150,
              child: SfRadialGauge(axes: <RadialAxis>[
                RadialAxis(minimum: 0, maximum: 4, ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: GaugeValues[RunType.walking]["minStart"],
                    endValue: GaugeValues[RunType.walking]["minEnd"],
                    color: Colors.grey,
                    startWidth: 10,
                    endWidth: 10,
                  ),
                  GaugeRange(
                    startValue: GaugeValues[RunType.walking]["rangeIn"],
                    endValue: GaugeValues[RunType.walking]["rangeOut"],
                    color: Colors.green,
                    startWidth: 10,
                    endWidth: 10,
                  ),
                  GaugeRange(
                    startValue: 3.5,
                    endValue: 4,
                    color: Colors.grey,
                    startWidth: 10,
                    endWidth: 10,
                  )
                ], pointers: <GaugePointer>[
                  NeedlePointer(value: double.parse(speedInMps))
                ], annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Text(speedInMps,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      angle: 90,
                      positionFactor: 0.5)
                ])
              ]),
            ),
          ],
        ),
        SizedBox(
          width: 70,
          height: 180,
          child: Column(
            children: <Widget>[
              Text(
                steps,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Icon(
                Icons.crisis_alert_outlined,
                color: Colors.black,
                size: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
