import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Top extends StatelessWidget {
  double meter;
  double meterTemp;
  double meterGauge;
  double energyGaugeValue; // 빨간색 게이지

  int energyValue; // 파란색 게이지 (보유 에너지 전체)
  int energyCount; // 에너지 총 total 갯수

  int gaugeCountValue; // (Run)
  int adrenaline;

  Top({
    required this.meter,
    required this.meterTemp,
    required this.meterGauge,
    required this.gaugeCountValue,
    required this.adrenaline,
    required this.energyCount,
    required this.energyGaugeValue,
    required this.energyValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.run_circle,
                  ),
                  Text('${meterGauge.toStringAsFixed(2)}/$gaugeCountValue'),
                  Text(
                    '+$meterTemp',
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                child: SfLinearGauge(
                  minimum: 0,
                  maximum: double.parse(gaugeCountValue.toString()),
                  // ranges: [
                  //   LinearGaugeRange(
                  //     startValue: 0,
                  //     endValue: 50,
                  //   ),
                  // ],
                  markerPointers: [
                    // 화살표
                    LinearShapePointer(
                      value: meterGauge,
                    ),
                  ],
                  barPointers: [
                    LinearBarPointer(
                      value: double.parse(meterGauge.toStringAsFixed(1)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.electric_bolt,
                    color: Colors.blue,
                  ),
                  Text('Energy $energyValue/$energyCount'),
                  Text(
                    (adrenaline == 0 ? '' : '-$adrenaline'),
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SfLinearGauge(
                minimum: 0,
                maximum: energyCount.toDouble(),
                ranges: [
                  // 빨간색 선
                  LinearGaugeRange(
                    startValue: 0,
                    endValue: energyGaugeValue,
                    // endValue: energyCount.toDouble(),
                  ),
                ],
                markerPointers: [
                  // 포인터
                  LinearShapePointer(
                    value: energyGaugeValue,
                    // value: (energyCount - adrenaline).toDouble(),
                  ),
                ],
                barPointers: [LinearBarPointer(value: energyValue.toDouble())],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
