import 'package:flutter/material.dart';

/**
 * 一个图片逐渐放大的动画
 */
class ScaleAnimationRoute extends StatefulWidget{
  @override
  _ScaleAnimationRouteState createState() {
    
    return _ScaleAnimationRouteState();
  }
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    //初始化动画控制器
    controller =AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    //设置动画弹性曲线
    animation =CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCirc,
    );
    //设置动画变化过程
    animation =Tween(begin: 100.0,end: 300.0).animate(animation)
        ..addListener(
          (){
            setState(() {
              //动画指定过程中重新绘制
            });
          }
        );

    controller.forward();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("一个图片逐渐放大的动画"),
      ),
      body: Center(
        child: Image.asset("icon/ic_mine_qrcode.jpg",
          width: animation.value,
          height: animation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    //关闭页面的时候需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}