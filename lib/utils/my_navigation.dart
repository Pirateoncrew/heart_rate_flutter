import 'package:flutter/material.dart';

class MyNavigation {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }
}
