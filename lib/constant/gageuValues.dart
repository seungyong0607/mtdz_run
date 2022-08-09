import 'package:flutter/material.dart';

// ignore: constant_identifier_names
// const Color PRIMARY_COLOR = Color(0xFF2D2D33);
// const Color RED_COLOR = Color(0xFFEA4955);
// const Color BLUE_COLOR = Color(0xFF549FBF);

enum RunType {
  walking,
  jogging,
  runner,
}

// ignore: constant_identifier_names
const Map GaugeValues = {
  RunType.walking: {
    "minStart": 0.0,
    "minEnd": 0.5,
    "rangeIn": 0.5,
    "rangeOut": 3.5,
    "maxStart": 3.5,
    "maxEnd": 4.0,
  },
  RunType.jogging: {
    "minStart": 0.0,
    "minEnd": 0.5,
    "rangeIn": 0.5,
    "rangeOut": 3.5,
    "maxStart": 3.5,
    "maxEnd": 4.0,
  },
  RunType.runner: {
    "minStart": 0.0,
    "minEnd": 0.5,
    "rangeIn": 0.5,
    "rangeOut": 3.5,
    "maxStart": 3.5,
    "maxEnd": 4.0,
  },
};
