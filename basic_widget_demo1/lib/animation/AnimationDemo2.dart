import 'package:flutter/material.dart';
/**
 * 使用AnimatedBuider封装一个对子控件实现放大动画的效果
 */

class Growtransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  Growtransition({this.child, this.animation});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (context, child) {
          return Container(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}

//最开始实现的动画效果现在可以用如下的方式实现
class AnimationDemo2 extends StatefulWidget {
  @override
  _AnimationDemo2State createState() {
    return _AnimationDemo2State();
  }
}

class _AnimationDemo2State extends State<AnimationDemo2>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _animation = Tween(begin: 100.0, end: 500.0).animate(_animation);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("使用AnimatedBuilder封装Widget"),
      ),
      body: Center(
        child: Growtransition(
          animation: _animation,
          child: Image.asset("icon/ic_mine_qrcode.jpg"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
