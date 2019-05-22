import 'package:flutter/material.dart';
import 'StaggerAnimationDemo.dart';
/**
 * 启动交错动画的页面
 * 
 */
class StaggerDemo extends StatefulWidget{
  @override
  _StaggerDemoState createState() {
    return _StaggerDemoState();
  }
}

class _StaggerDemoState extends State<StaggerDemo> with SingleTickerProviderStateMixin{
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
  }

  //设置动画执行在子线程
  Future<Null> _playAnimation() async{
    try{
      //先正向执行
      await _controller.forward().orCancel;
      //再反向执行
      await _controller.reverse().orCancel;
    }on TickerCanceled{
      print("捕获到异常信息");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("交错动画StaggerAnimation演示Demo"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          print("点击开始播放动画");
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              )
            ),
            
            child: StaggerAnimationWidget(
              controller: _controller,
            ),
          ),
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