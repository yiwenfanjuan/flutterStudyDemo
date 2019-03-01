import 'package:flutter/material.dart';
/**
 * 导航返回拦截WillPopScope
 */
class WillPopScopeDemo extends StatefulWidget{
  @override
  _WillPopScopeDemoState createState() {
    // TODO: implement createState
    return _WillPopScopeDemoState();
  }
}

class _WillPopScopeDemoState extends State<WillPopScopeDemo>{
  //点击返回键的计时
  DateTime _clickBackTime;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("WillPopScope Demo演示"),
      ),
      body: WillPopScope(
        child: Container(
          color: Colors.blue,
          constraints: BoxConstraints.expand(),
          alignment: Alignment.center,
          child: Text(
            "两秒内连续点击两次返回键便会退出",
            style:TextStyle(
              color: Colors.white,
              fontSize: 14.0
            ),
          ),
        ),
        onWillPop: () async{
          if(_clickBackTime == null || (DateTime.now().difference(_clickBackTime) > Duration(seconds: 2))){
            //点击返回键的时间超过两秒
            _clickBackTime =DateTime.now();
            return false;
          }
          return true;
        },
      ),
    );
  }
}