import 'package:flutter/material.dart';

class MainGaugePart extends StatelessWidget {
  bool _isRecording = true;
  List shoesList;

  MainGaugePart({
    required this.shoesList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomIcons(
            iconType: const Icon(Icons.timer, size: 40),
            text: '76%',
          ),
          CustomIcons(
            iconType: const Icon(
              Icons.auto_awesome,
              size: 40,
            ),
            text: '23%',
          ),
          CustomIcons(
            iconType: const Icon(Icons.local_fire_department, size: 40),
            text: '51%',
          ),
          CustomIcons(
            iconType: const Icon(Icons.fitness_center, size: 40),
            text: '92%',
          ),
        ],
      ),
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
