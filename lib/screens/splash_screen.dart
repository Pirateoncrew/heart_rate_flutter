import 'package:heartRate/utils/my_navigation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      MyNavigation.goToHome(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatingIcons(),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text(
                          'Heart Rate',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatingIcons extends StatefulWidget {
  AnimatingIcons({Key key}) : super(key: key);

  @override
  _AnimatingIconsState createState() => _AnimatingIconsState();
}

class _AnimatingIconsState extends State<AnimatingIcons>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Icon heartIcon;
  double size = 10;
  @override
  void initState() {
    heartIcon = Icon(
      Icons.healing,
      color: Colors.redAccent,
      size: size,
    );
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0.5,
    );
    _animation = Tween<double>(begin: 2, end: 7).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInBack),
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    });
    _controller.addListener(() {
      setState(() {
        size = _controller.value * 250;
      });
    });
  }

  @override
  void didUpdateWidget(AnimatingIcons oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          // Transform.rotate(angle: _animation.value, child: heartIcon);
          return Transform.scale(scale: _animation.value, child: heartIcon);
        },
      ),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
