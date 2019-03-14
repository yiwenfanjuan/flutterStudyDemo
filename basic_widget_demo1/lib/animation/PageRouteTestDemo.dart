import 'package:flutter/material.dart';
/**
 * 自定义路由切换动画
 */
class PageRouteDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("路由切换动画效果查看"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.lightGreenAccent,
      ),
    );
  }
}