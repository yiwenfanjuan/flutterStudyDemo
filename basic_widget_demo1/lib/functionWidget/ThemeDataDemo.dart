import 'package:flutter/material.dart';

class ThemeDataDemo extends StatefulWidget{
  @override
  _ThemeDataDemoState createState() {
    // TODO: implement createState
    return _ThemeDataDemoState();
  }
}

class _ThemeDataDemoState extends State<ThemeDataDemo>{
  Color _themeColor = Colors.teal;//当前路由主题色
  @override
  Widget build(BuildContext context) {
    //获取当前主题
    ThemeData themeData = Theme.of(context);

    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,//用于导航栏，FloatingActionButton的背景色等
        iconTheme: IconThemeData(color: _themeColor,size: 40.0),//用于Icon颜色
      ),
      child: Scaffold(
        appBar: AppBar(title: Text("主题测试Demo"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text("颜色跟随主题")
              ],
            ),

            //为第二行Icon自定义颜色，固定为黑色
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("颜色固定为黑色")
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.palette),
          onPressed: (){
            //切换主题
            setState(() {
             _themeColor =_themeColor == Colors.teal ? Colors.blue : Colors.teal; 
            });
          },
        ),
      ),
    );
  }
}