import 'package:flutter/material.dart';
import 'AnimationDemo2.dart';
/**
 * 动画状态监听：动画循环执行
 */
class AnimationDemo3 extends StatefulWidget{
  @override
  _AnimationDemo3State createState() {
    return _AnimationDemo3State();
  }
}

class _AnimationDemo3State extends State<AnimationDemo3> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween(begin: 30.0,end: 300.0).animate(_controller);

    //给动画控制器添加状态监听
    _controller.addStatusListener(
      (status){
        if(status == AnimationStatus.completed){
          //动画结束时反转动画
          _controller.reverse();
        }else if(status == AnimationStatus.dismissed){
          //动画在起点停止时正向执行
          _controller.forward();
        }
      }
    );

    //开始执行动画
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画状态监听--循环执行的动画"),
      ),
      body: Growtransition(
        child: Image.asset("icon/ic_mine_qrcode.jpg"),
        animation: _animation,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}