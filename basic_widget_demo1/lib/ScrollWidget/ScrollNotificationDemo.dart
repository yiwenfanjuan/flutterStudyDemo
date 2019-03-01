import 'package:flutter/material.dart';
/**
 * 滚动监听
 */

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() {
    // TODO: implement createState
    return _ScrollNotificationTestRouteState();
  }
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //进度百分比
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动监听demo"),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            //计算当前滑动的进度
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;

            //查看是否滚动到顶部
            //extentBefore表示会出ViewPort的长度
            //这种方法计算的不准
            if(notification.metrics.atEdge && notification.metrics.extentBefore <= 0){
              print("滚动到列表顶部");
            }
            //extentAfter表示未滑入到ViewPort的部分
            //这种方法计算的不准
            if(notification.metrics.atEdge && notification.metrics.extentAfter <= 0){
              print("滚动到列表底部");
            }

            //重新构建
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
              //print("滑动进度$_progress");
            });
            return true;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${index}"),
                  );
                },
              ),

              //显示进度百分比
              CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
