import 'package:flutter/material.dart';

class ShowSnackBar {
  final String data;
  final BuildContext context;
  const ShowSnackBar({required this.data, required this.context});

  void showSnack() {
    final snackBar = SnackBar(content: Text(data));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
