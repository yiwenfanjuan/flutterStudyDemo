import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioHttpDemoRouter extends StatefulWidget {
  @override
  _DioHttpDemoRouterState createState() {
    // TODO: implement createState
    return _DioHttpDemoRouterState();
  }
}

class _DioHttpDemoRouterState extends State<DioHttpDemoRouter> {
  String _baiduIndexStr = "加载中，请稍候...";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getHttp();
    _getServices().then((response) {
      setState(() {
        _baiduIndexStr = response.data.toString().replaceAll(RegExp(r"\s"), "");
      });
      
    },
      onError: (exception){
          print("请求出错：${exception.toString()}");
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Dio Http Demo")),
      body: Center(
        child: SingleChildScrollView(
          child: Text(_baiduIndexStr),
        ),
      ),
    );
  }

  //使用dio请求百度首页的数据
  void getHttp() async {
    try {
      Response response = await Dio().get("http://www.baidu.com");
      print(response);
      setState(() {
        _baiduIndexStr = response.toString().replaceAll(RegExp(r"[\s]"), "");
      });
    } catch (e) {
      print(e);
    }
  }

  //获取网络数据
  Future<Response> _getServices() {
    return  Dio().get<String>("http://www.baidu.com");
  }

}
