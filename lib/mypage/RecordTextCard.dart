import 'package:flutter/material.dart';

class RecordTextCard extends StatelessWidget {
  const RecordTextCard({super.key});

  @override
  Widget build(BuildContext context) {
    const ts = TextStyle(
      color: Colors.white,
      decoration: TextDecoration.none,
      fontSize: 14,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        Text(
          '1.2 km',
          textAlign: TextAlign.right,
          style: ts,
        ),
        Text(
          '15m 23s',
          style: ts,
        ),
        Text(
          '3256 steps',
          style: ts,
        ),
      ],
    );
  }
}
