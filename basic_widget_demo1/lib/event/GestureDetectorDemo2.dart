import 'package:flutter/material.dart';

/**
 * 手势冲突demo演示
 */
class GestureDetectorDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势监听----事件竞争和冲突"),
      ),
      body: _GestureDetectorTest(),
    );
  }
}

class _GestureDetectorTest extends StatefulWidget {
  @override
  _GestureDetectorTestState createState() {
    return _GestureDetectorTestState();
  }
}

class _GestureDetectorTestState extends State<_GestureDetectorTest> {
  //距离上边的偏移量
  double _offsetTop = 0;
  //距离左边的偏移量
  double _offsetLeft = 0;

  //每次滑动都会设置当前距离上边和左边的偏移量
  void _updatePosition({double offsetTop = 0, double offsetLeft = 0}) {
    setState(() {
      _offsetTop += offsetTop;
      _offsetLeft += offsetLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: _offsetLeft,
          top: _offsetTop,
          child: GestureDetector(
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("Click"),
            ),
            //监听垂直方向的滑动事件
            onVerticalDragUpdate: (DragUpdateDetails details) {
              _updatePosition(offsetTop: details.delta.dy);
            },
            //监听水平防线的滑动事件
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              _updatePosition(offsetLeft: details.delta.dx);
            },
          ),
        ),
        Positioned(
          top: 100.0,
          left: _offsetLeft,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("Move"),
              backgroundColor: Colors.redAccent,
            ),
            //监听水平方向移动事件
            onHorizontalDragUpdate: (details) {
              _updatePosition(offsetLeft: details.delta.dx);
            },
            //监听水平方向结束事件
            onHorizontalDragEnd: (DragEndDetails details) {
              print("HorizontalDragEnd...$details");
            },
            //按下事件
            onTapDown: (TapDownDetails details) {
              print("TapDown...$details");
            },
            //抬起事件
            onTapUp: (TapUpDetails details) {
              print("TapUp...$details");
            },
          ),
        ),
        Positioned(
          top: 200.0,
          left: _offsetLeft,
          child: Listener(
            //监听指针按下事件
            onPointerDown: (PointerDownEvent event) {
              print("PointerDown...$event");
            },
            //监听指针抬起事件
            onPointerUp: (PointerUpEvent event) {
              print("PointerUp...$event");
            },
            child: GestureDetector(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: Center(
                    child: Text(
                      "哼",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              //监听水平滑动事件
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                _updatePosition(offsetLeft: details.delta.dx);
              },
              //监听水平方向滑动停止事件
              onHorizontalDragEnd: (DragEndDetails details) {
                print("HorizontalDragEnd...$details");
              },
            ),
          ),
        ),
      ],
    );
  }
}
