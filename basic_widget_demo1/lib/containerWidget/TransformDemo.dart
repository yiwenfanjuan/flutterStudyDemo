import 'package:flutter/material.dart';
import 'dart:math' as Math;

/**
 * 矩阵变换
 */
class TransformDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform变换"),
        centerTitle: true,
      ),
      body: TransformTest(),
    );
  }
}

//Transform
class TransformTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //倾斜
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("倾斜效果如下"),
                Container(
                  color: Colors.black,
                  child: Transform(
                    alignment: Alignment.topLeft, //相对于坐标原点的对齐方式
                    transform: Matrix4.skewY(0.2), //沿Y轴倾斜0.3弧度
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.orange,
                      child: Text("Transform Test Demo"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //平移
        Expanded(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("平移效果如下"),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  //默认圆点为左上角，右移20像素，下移20像素
                  child: Transform.translate(
                    offset: Offset(20, 20),
                    child: Text("Transform translate"),
                  ),
                ),
              )
            ],
          ),
        ),
        //旋转
        Expanded(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("旋转效果如下"),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
                child: Transform.rotate(
                  angle: Math.pi / 2, //旋转90度
                  child: Text("Transform Rotate Demo"),
                ),
              ),
            ],
          ),
        ),
        //缩放
        Expanded(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("缩放效果如下："),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.pink),
                child: Transform.scale(
                  scale: 1.5,
                  child: Text("Transform Scale Demo"),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: <Widget>[
              Text("RotatedBox的旋转效果"),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.pink),
                child: RotatedBox(
                  quarterTurns: 1,//旋转90度， 1/4圈
                  child: Text("RotatedBox实现旋转"),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
