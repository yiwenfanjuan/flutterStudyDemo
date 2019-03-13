import 'package:flutter/material.dart';
/**
 * 通知demo
 */
class NotificationDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Demo测试"),
      ),
      body: NotificationListener(
        onNotification: (notification){
          //print("$notification");
          switch (notification.runtimeType) {
            case ScrollStartNotification:
              print("开始滚动");
              break;
            case ScrollEndNotification:
              print("结束滚动");
              break;
            case ScrollUpdateNotification:
              print("正在滚动");
              break;
            case OverscrollNotification:
              print("滚动到边界");
              break;
            default:
              print("没有识别到具体的通知类型:${notification.runtimeType}");
          }
        },

        child: ListView.separated(
          itemCount: 100,
          itemBuilder: (context,index){
            return Container(
              constraints: BoxConstraints.expand(height: 80.0),
              alignment: Alignment.center,
              color: Colors.blueAccent,
              child: Text("第$index个item",style: TextStyle(color: Colors.white),),
            );
          },
          separatorBuilder: (context,index){
            return Container(
              constraints: BoxConstraints.expand(height: 2.0),
              color: Colors.white54,
            );
          },
        ),
      ),
    );
  }
}