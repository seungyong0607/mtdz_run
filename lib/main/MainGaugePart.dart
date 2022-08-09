import 'package:flutter/material.dart';

class MainGaugePart extends StatelessWidget {
  bool _isRecording = true;
  Map<dynamic, dynamic> shoes;

  MainGaugePart({
    required this.shoes,
    Key? key,
  }) : super(key: key);

//        'durability': 100,
//       'Efficiency': 1.0,
//       'Luck': 1.0,
//       'Comfort': 1.0,
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomIcons(
          iconType: const Icon(
            Icons.timer,
            size: 40,
          ),
          text: "${shoes['durability']}%",
        ),
        CustomIcons(
          iconType: const Icon(
            Icons.auto_awesome,
            size: 40,
          ),
          text: "${shoes['Luck']}%",
        ),
        CustomIcons(
          iconType: const Icon(Icons.local_fire_department, size: 40),
          text: "${shoes['Efficiency']}%",
        ),
        CustomIcons(
          iconType: const Icon(Icons.fitness_center, size: 40),
          text: "${shoes['Comfort']}%",
        ),
      ],
    );
  }
}

class CustomIcons extends StatelessWidget {
  Icon iconType;
  String text;

  CustomIcons({
    required this.iconType,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(width: 3.0, color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Column(children: [iconType, Text(text)]),
      ),
    );
  }
}
