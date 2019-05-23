import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/**
 * 插件开发--获取宿主平台的电量信息
 */

class BetteryInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "插件开发--获取电量",
          style: TextStyle(
            color: Colors.greenAccent,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        elevation: 0.0,
        backgroundColor: Colors.lime,
      ),
      body: BetteryInfoRoute(),
    );
  }
}

class BetteryInfoRoute extends StatefulWidget {
  @override
  _BetteryInfoRouteState createState() {
    return _BetteryInfoRouteState();
  }
}

class _BetteryInfoRouteState extends State with SingleTickerProviderStateMixin {
  static const platform = const MethodChannel("samples.flutter.io/battery");
  //默认电量100%
  double _currentBetteryInfo = 100;
  //当前的文字颜色，根据不同的电量改变
  Color _betteryColor = Colors.greenAccent;
  //动画控制器
  AnimationController _animationController;
  //动画
  Animation _animation;
  //显示当前获取电量的状态信息
  String _currentState = "正在获取信息";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setBatteryColor();
    getValueColorAnimation();
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    //一个圆形进度条中间显示电量的百分比
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(width: 120.0, height: 120.0),
            child: CircularProgressIndicator(
              backgroundColor: Colors.redAccent,
              valueColor: _animation,
              value: _currentBetteryInfo / 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              _currentState,
              style: TextStyle(
                color: _betteryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //设置动画
  void getValueColorAnimation() {
    if (_animationController == null) {
      _animationController =
          AnimationController(duration: Duration(seconds: 5), vsync: this);
    }
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.ease);
    _animation = Tween(begin: _betteryColor, end: Colors.greenAccent)
        .animate(_animation);
  }

  //设置不同电量的颜色
  void setBatteryColor() {
    if (_currentBetteryInfo > 80) {
      _betteryColor = Colors.greenAccent;
    } else if (_currentBetteryInfo > 50) {
      _betteryColor = Colors.orangeAccent;
    } else {
      _betteryColor = Colors.redAccent;
    }
  }

  //获取电量
  Future<Null> _getBatteryLevel() async {
    try {
      _currentBetteryInfo = await platform.invokeMethod("getBatteryLevel");
      _currentState = "${_currentBetteryInfo.toString()}%";
    } on PlatformException catch (e) {
      //出现异常
      _currentState = "failed";
    } finally {
      //最终都会执行刷新操作
      setState(() {
        setBatteryColor();
        getValueColorAnimation();
      });
    }
  }
}
