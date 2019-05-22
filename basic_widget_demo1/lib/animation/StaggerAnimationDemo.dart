import 'package:flutter/material.dart';

/**
 * 交错动画演示Demo
 * 提取动画widget
 */

class StaggerAnimationWidget extends StatelessWidget {
  //动画控制器
  final AnimationController controller;
  //高度变化动画
  Animation<double> _heightAnimation;
  //间距动画
  Animation<EdgeInsets> _paddingAnimation;
  //颜色变化动画
  Animation<Color> _colorAnimation;

  //构造函数
  StaggerAnimationWidget({Key key, this.controller}) : super(key: key) {
    //初始化高度动画
    _heightAnimation = Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.6,
          curve: Curves.ease,
        ) //间隔，前60%的动画时间

        ));

    //颜色变化动画
    _colorAnimation =
        ColorTween(begin: Colors.blueAccent, end: Colors.redAccent)
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(
                  0.0, 0.6, //前60%的动画时间
                  curve: Curves.ease,
                )));

    //padding变化动画
    _paddingAnimation = Tween<EdgeInsets>(
            begin: EdgeInsets.only(left: 0.0),
            end: EdgeInsets.only(left: 100.0))
        .animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.6, 1.0, //间隔，剩余的40%的动画执行时间
              curve: Curves.ease,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          alignment: Alignment.bottomCenter,
          padding: _paddingAnimation.value,
          child: Container(
            color: _colorAnimation.value,
            width: 50.0,
            height: _heightAnimation.value,
          ),
        );
      },
    );
  }
}
