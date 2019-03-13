import 'package:flutter/material.dart';

/**
 * 抽象上面的图片逐渐放大的图片的动画
 */
class AnimationImage extends AnimatedWidget{
  
  AnimationImage({Key key,Animation<double> animation})
    :super(key:key,listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation =listenable;
    return Center(
      child: Image.asset("icon/ic_mine_qrcode.jpg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class ScaleAnimationDemo extends StatefulWidget{
  @override
  _ScaleAnimationDemoState createState() {
    return _ScaleAnimationDemoState();
  }
}

class _ScaleAnimationDemoState extends State<ScaleAnimationDemo> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();

    controller =AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    );

    animation =CurvedAnimation(parent: controller,curve: Curves.fastLinearToSlowEaseIn);

    //设置从0变化到300
    animation =Tween(begin: 0.0,end: 300.0).animate(animation);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title:Text("使用AnimatedWidget重构图片放大的动画"),
      ),
      //使用AnimatedWidget
      /*
      body: AnimationImage(
        animation: animation,
      ),
      */
      //使用AnimatedBuilder
      body: AnimatedBuilder(
        animation: animation,
        child: Image.asset("icon/ic_mine_qrcode.jpg"),
        builder:(context,widget){
          return Center(
            child: Container(
              width: animation.value,
              height: animation.value,
              child: widget,
            ),
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}