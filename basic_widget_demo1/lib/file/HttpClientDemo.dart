import 'dart:convert';

/**
 * 使用HttpClient发起Http请求
 */

import 'package:flutter/material.dart';
import 'dart:io';

class HttpClientDemoRoute extends StatefulWidget {
  @override
  _HttpClientDemoRouteState createState() {
    // TODO: implement createState
    return _HttpClientDemoRouteState();
  }
}

class _HttpClientDemoRouteState extends State<HttpClientDemoRoute> {
  //网络请求到的数据
  String _serverContent = "正在请求数据，请稍后...";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readServer();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HttpClient Demo",
          style: TextStyle(fontSize: 14.0, color: Colors.amberAccent),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: _readServer(),
          builder:(context,shot){
            if(shot.connectionState == ConnectionState.done){
              return Text(
                _serverContent.substring(0,10000),
                style: TextStyle(
                  color: Colors.cyanAccent,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                textAlign: TextAlign.start,
              );
            }else{
              return CircularProgressIndicator();
            }
          }
        ),
      ),
    );
  }

  //请求网络数据
   _readServer() async {
    //创建一个HttpClient
    HttpClient httpClient = HttpClient();

    //打开http链接，设置请求头
    HttpClientRequest request =
        await httpClient.getUrl(Uri.parse("http://www.baidu.com"));
    //这一步可以根据具体的需求使用不同的方法，如：httpClient.post(),httpClient.delete等，如果在请求时包含query参数，
    //可以在构建uri的时候添加:
    Uri uri = Uri(
      scheme: "https",
      host: "flutterchina.club",
      queryParameters: {"name": "哈哈哈", "type": "1"},
    );
    //通过HttpClientRequest可以设置请求header
    request.headers.add("user-agent", "test");
    //如果是post或者put等可以携带请求体方法，可以通过HttpClientRequest对象发送request body
    String payload = "hahah";
    //request.add(utf8.encode(payload));
    //可以直接添加输入流：
    //request.addStream(_inputSream);
    //等待链接服务器
    HttpClientResponse response = await request.close();
    //这一步完成以后，请求信息就已经发送给服务器了，返回一个HttpClientResponse对象，它包含响应头(header)和响应流(响应体的Stream)，
    //接下来就可以通过读取响应流来获取响应内容
    //读取响应内容
    String responseBody = await response.transform(utf8.decoder).join();
    print("读取到的响应内容是：$responseBody");

    //请求结束，关闭httpClient
    httpClient.close();
    //关闭client后，通过该client发起的任何请求都会中止
    //将请求到的数据设置到view中
    Future<String> dealStr = _dealData(responseBody);
    dealStr.then((value) {
      print("数据处理完成:${value.length}");
      _serverContent = value;
      // setState(() {
      //   print("修改状态");
      // });
    });
    
    return responseBody;
  }

  //处理请求到的数据
  Future<String> _dealData(String str) async{
      print("开始处理数据");
      return str.replaceAll(RegExp(r"\s"), "");
  }

}
