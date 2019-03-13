import 'package:flutter/material.dart';
/**
 * 自定义通知
 */
//定义通知类，继承Notification类
class CustomNotification extends Notification{
  String msg;
  CustomNotification(this.msg);
} 

class CustomNotificationDemo extends StatefulWidget{

  @override
  _CustomNotificationDemoState createState() {
    return _CustomNotificationDemoState();
  }
}

class _CustomNotificationDemoState extends State<CustomNotificationDemo>{
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义Notification Demo"),
      ),
      body: NotificationListener<CustomNotification>(
        onNotification: (notification){
          
          setState(() {
            _msg +=notification.msg + "";
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // RaisedButton(
            //   child: Text("Click me to send notification"),
            //   onPressed: (){
            //     //点击发送自定义通知
            //   },
            // )
            Builder(
              builder: (context){
                return RaisedButton(
                  child: Text("Click Me To Send Notification"),
                  onPressed: (){
                    //点击发送自定义通知
                    CustomNotification("哈哈哈").dispatch(context);
                  },
                );
              },
            ),
            Text(
              _msg
            ),
          ],
        ),
      ),
    );
  }
}