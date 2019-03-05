import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
/**
 * GestureDetector 拖动，滑动事件demo
 */

class GestureDetectorDemo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("手势识别----滑动/拖动事件"),),
      body: _GestureDetectorTest(),
    );
  }
}

class _GestureDetectorTest extends StatefulWidget{
  @override
  _GestureDetectorTestState createState() {
    return _GestureDetectorTestState();
  }
}

class _GestureDetectorTestState extends State<_GestureDetectorTest>{
  //距离顶部的偏移量
  double _offsetTop = 0.0;
  //距离左边的偏移量
  double _offsetLeft = 30.0;
  //图片的宽度
  double _width = 200.0;
  //TextSpan的部分文字点击事件
  TapGestureRecognizer _tapGestureRecognizer =TapGestureRecognizer();
  //变色开关
  bool _toggle = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _offsetTop,
          left:_offsetLeft,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e){
              print("用户手指按下:$e");
            },

            //手指滑动时会触发此回调
            /*
            onPanUpdate: (DragUpdateDetails e){
              setState(() {
               _offsetLeft += e.delta.dx;
               _offsetTop += e.delta.dy; 
              });
            },
            */
            //设置只监听竖直方向的滑动
            onVerticalDragUpdate: (DragUpdateDetails e){
              setState(() {
               _offsetTop += e.delta.dy; 
              });
            },
            //结束时会触发此回调
            onPanEnd: (DragEndDetails e){
              //打印结束时的速度
              print("拖动/滑动结束:${e.velocity}");
            },
          ),
        ),
        Center(
          child: GestureDetector(
            child: Image.asset("icon/ic_mine_qrcode.jpg",width: _width,),
            onScaleUpdate: (ScaleUpdateDetails details){
              setState(() {
               _width = 200 * details.scale.clamp(0.8, 100.0); 
              });
            },
          ),
        ),

        //设置点击富文本变色
        Positioned(
          right: 0.0,
          bottom: 0.0,
          child: Container(
            constraints: BoxConstraints.tight(Size(300.0,200.0)),
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "Hello World"),
                  TextSpan(
                    text: "点我变色",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: _toggle ? Colors.black : Colors.white,
                    ),
                    recognizer: _tapGestureRecognizer
                      ..onTap = (){
                        setState(() {
                          _toggle = !_toggle;
                        });
                      }
                  ),
                  TextSpan(
                    text: "你好世界",
                  ),
                ]
              ),

            ),
          ),
        ),
      ],
    );
  }
  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
    
  }
}