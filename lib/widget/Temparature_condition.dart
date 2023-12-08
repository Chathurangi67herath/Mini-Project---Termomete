import 'package:flutter/material.dart';

class TempCondition {
  static Map<String, Map<String, dynamic>> temCondition = {
    "high": {
      "condition": "High",
      "icon": " 😑",
      "color": Colors.red,
      "colorPrimary": Color.fromARGB(255, 249, 19, 3),
      "colorSecondery": const Color.fromARGB(255, 255, 82, 82),
      "currentStatus": "Temprature is too high \nTurned on Cooler"
    },
    "normal": {
      "condition": "Normal",
      "icon": " 🙂",
      "color": Colors.green,
      "colorPrimary": Color.fromARGB(255, 16, 141, 20),
      "colorSecondery": Color.fromARGB(255, 42, 181, 114),
      "currentStatus": "Good \nWorking Correctly"
    },
    "low": {
      "condition": "Low",
      "icon": " 😑",
      "color": Colors.red,
      "colorPrimary": Color.fromARGB(255, 249, 19, 3),
      "colorSecondery": const Color.fromARGB(255, 255, 82, 82),
      "currentStatus": "Temprature is too low \nTurned on Heater"
    },
  };
}
