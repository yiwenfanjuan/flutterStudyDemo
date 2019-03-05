import 'package:flutter/material.dart';

/**
 * 手势识别demo
 */
class GestureDetectorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别测试demo"),
      ),
      body: _GestureDetectorTest(),
    );
  }
}

class _GestureDetectorTest extends StatefulWidget {
  @override
  _GestureDetectorTestState createState() {
    return _GestureDetectorTestState();
  }
}

class _GestureDetectorTestState extends State<_GestureDetectorTest> {
  //保存事件名
  String _operation = "No Gesture detected";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          constraints: BoxConstraints.tight(Size(300.0, 200.0)),
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            _operation,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        onTap: (){
          updateEventName("点击事件");
        },
        onDoubleTap: (){
          updateEventName("双击事件");
        },
        onLongPress: (){
          updateEventName("长按事件");
        },
      ),
    );
  }

  //更新事件名称
  void updateEventName(String text){
    setState(() {
     this._operation =text; 
    });
  }
}
