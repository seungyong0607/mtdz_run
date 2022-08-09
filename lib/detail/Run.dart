import 'package:flutter/material.dart';

class Run extends StatelessWidget {
  double meter;
  double meterTemp;
  String status;

  Run({
    required this.meter,
    required this.meterTemp,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          meter.toStringAsFixed(2),
          style: const TextStyle(
            fontSize: 60,
          ),
        ),
        const Text(
          'Meters',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              (status == 'walking'
                  ? Icons.run_circle
                  : Icons.accessibility_new),
              size: 50,
            ),
            Text(
              ((status == 'walking' && meterTemp != 0.0) ? '+$meterTemp' : ''),
              style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
