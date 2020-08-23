import 'package:flutter/material.dart';
import './heart_monitor.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageView createState() {
    return HomePageView();
  }
}

class HomePageView extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ,
      body: Center(
        child: HeartMonitor(),
      ),
    );
  }
}
