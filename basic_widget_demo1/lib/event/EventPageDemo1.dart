import 'package:flutter/material.dart';
import 'EventDemo2.dart';
/**
 * 全局事件demo演示1
 */
class EventPageDemo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("全局事件页面1"),),
      body: Center(
        child: RaisedButton(
          child: Text("点击登录"),
          onPressed: (){
            //用户点击登录之后将用户的信息通知其它需要用到的页面
              bus.emit("loginSuccess", "Jack");
          },
        ),
      ),
    );
  }
}