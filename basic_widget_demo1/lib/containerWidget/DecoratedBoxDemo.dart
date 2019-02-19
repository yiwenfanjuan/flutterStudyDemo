import 'package:flutter/material.dart';
/**
 * 装饰容器DecoratedBox
 */

class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("装饰容器DecoratedBox"),
        centerTitle: true,
      ),
      body: DecoratedBoxTest(),
    );
  }
}

//DecoratedBox
class DecoratedBoxTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: 20.0, left: 20.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            //设置渐变
            gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
            borderRadius: BorderRadius.circular(4.0), //4像素圆角
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
          child: Text("Login", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
