import 'package:heartRate/providers/circulat_animation_provider.dart';
import 'package:heartRate/animation/circular.dart';
import 'package:heartRate/widget/bpm_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeartWidget extends StatefulWidget {
  final bool _toggled; // toggle button value
  // final double _iconScale;
  final Function _untoggle;
  final Function _toggle;
  final int _bpm;
  HeartWidget(this._toggled, this._toggle, this._untoggle, this._bpm);

  @override
  _HeartWidgetState createState() => _HeartWidgetState();
}

class _HeartWidgetState extends State<HeartWidget>
    with TickerProviderStateMixin {
  AnimationController progressController;
  CircularAnimationProvider circularAnimation;

  Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 15000));
    animation = Tween<double>(begin: 0, end: 100).animate(progressController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(HeartWidget oldWidget) {
    // TODO: implement didUpdateWidget
  }

  @override
  Widget build(BuildContext context) {
    circularAnimation = Provider.of<CircularAnimationProvider>(context);
    if (circularAnimation.getStartAnimation) {
      resetCircular();
      progressController.forward();
    }

    return CustomPaint(
      foregroundPainter: CircleProgress(
          animation.value), // this will add custom painter after child

      child: Container(
        width: 200,
        height: 200,
        child: GestureDetector(
          onTap: () {
            // circularAnimation.startAnimation();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BpmWidget(widget._bpm),
              Icon(
                widget._toggled ? Icons.favorite : Icons.favorite_border,
                color: Colors.redAccent,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  resetCircular() {
    if (progressController.status == AnimationStatus.completed) {
      setState(() {
        progressController.value = 0;
        animation =
            Tween<double>(begin: 0, end: 100).animate(progressController);
      });
    }
  }
}
