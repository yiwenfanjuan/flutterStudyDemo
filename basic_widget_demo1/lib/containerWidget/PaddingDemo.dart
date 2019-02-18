import 'package:flutter/material.dart';
/**
 * Padding demo
 */

class PaddingDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Padding demo演示"),centerTitle: true,automaticallyImplyLeading: false,),
      body: PaddingTest(),
    );
  }
}

//padding
class PaddingTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            //四个方向均为10的补白
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: Text("这是第一个Padding"),
              color: Colors.blue,
            ),
          ),
          Padding(
            //同时指定四个方向的补白数值
            padding: EdgeInsets.fromLTRB(20,30, 40, 50),
            child: Container(
              child: Text("这是第二个Padding"),
              color: Colors.green,
            ),
          ),
          Padding(
            //选择指定某个/某几个方向的补白
            padding: EdgeInsets.only(left: 10,top: 50),
            child: Container(
              child: Text("这是第三个Padding"),
              color: Colors.red,
            ),
          ),
          Padding(
            //指定对称方向的补白
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              child: Text("这是第四个Padding"),
              color: Colors.grey,
            ),
          ),
        ],
    );
  }
}