import 'package:flutter/material.dart';
import 'dart:math' as math;

/**
 * 动画demo演示
 */
class AnimationDemo extends StatefulWidget{

 

  @override
  _AnimationDemoState createState() {
    return _AnimationDemoState();
  }
}

class _AnimationDemoState extends State<AnimationDemo> with SingleTickerProviderStateMixin<AnimationDemo>{

 final CurvedAnimation curve = CurvedAnimation(
    parent: AnimationController(
      //vsync: _AnimationDemoState.this,
    ),
    curve: Curves.easeIn,
    
  );

  final AnimationController controller =AnimationController(
    duration: const Duration(microseconds: 200),
    lowerBound: 10.0,
    upperBound: 20.0,
    //vsync: this,

  );

  final Tween doubleTween =Tween<double>(
    begin: -200.0,
    end: 0.0,
  );

  final ColorTween tween =ColorTween(
    begin: Colors.blue,
    end: Colors.red,
  );


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

//自定义一个动画变化的趋势(Curve)
class ShakeCurve extends Curve{
  @override
  double transform(double t) {
    return math.sin(t * math.pi * 2);
  }
}