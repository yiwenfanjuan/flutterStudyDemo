import 'package:flutter/material.dart';
import 'EventDemo2.dart';

/**
 * 事件总线demo第二个页面
 */
class EventPageDemo2 extends StatefulWidget {
  @override
  _EventPageDemo2State createState() {
    return _EventPageDemo2State();
  }
}

class _EventPageDemo2State extends State<EventPageDemo2> {
  _EventPageDemo2State() {
    updateLoginUser();
  }
  //登录的用户名
  String _loginUserName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("全局事件总线Demo2"),
      ),
      body: Center(
        child: Text(_loginUserName == null ? "没有用户登录" : "$_loginUserName 登录了"),
      ),
    );
  }

  //监听登录事件
  void updateLoginUser() {
    //这里需要注意的是：如果当前页面没有启动，那么也就没有将当前页面需要监控的事件加入到
    //全局时间总线中，是无法监听到的
    bus.add("loginSuccess", (param) {
      print("用户登录成功:$param");
    });
  }
}
