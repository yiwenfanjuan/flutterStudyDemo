import 'package:flutter/material.dart';

/**
 * Pointer事件处理
 */
class EventDemo1 extends StatefulWidget {
  @override
  _EventDemo1State createState() {
    return _EventDemo1State();
  }
}

class _EventDemo1State extends State<EventDemo1> {
  //点击事件
  PointerEvent _pointerEvent;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Listener Demo设置"),
      ),
      /*
      body: Listener(
        //behavior: HitTestBehavior.opaque,
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(300, 200)),
          child: Center(
            child: Text(
              _pointerEvent?.toString() ?? "哈哈哈",
              style: TextStyle(color: Colors.black, fontSize: 14.0),
            ),
          ),
        ),
        onPointerDown: (event) {
          setState(() {
            _pointerEvent = event;
          });
        },
        onPointerMove: (event) {
          setState(() {
            _pointerEvent = event;
          });
        },
        onPointerUp: (event) {
          setState(() {
            _pointerEvent = event;
          });
        },
      ),
      */
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ),
              onPointerDown: (event) {
                print("down0");
              },
            ),
            Listener(
              //behavior: HitTestBehavior.translucent,
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                child: Center(
                  child: Text("左上角200 * 100 范围内非文本区域点击"),
                ),
              ),
              onPointerDown: (event) {
                print("down1");
              },
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Listener(
                child: AbsorbPointer(
                  child: Listener(
                    child: Container(
                      constraints: BoxConstraints.tight(Size(200.0, 200.0)),
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text(
                        "测试AbsorbPointer",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPointerDown: (event) {
                      print("点击AbsorbPointer子Widget$event");
                    },
                  ),
                ),
                onPointerDown: (event) {
                  print("点击AbsorbPointer$event");
                },
              ),
            ),
            Positioned(
              left: 10.0,
              bottom: 0.0,
              child: Listener(
                child: IgnorePointer(
                  child: Listener(
                    child: Container(
                      constraints: BoxConstraints.tight(Size(200.0, 200.0)),
                      color: Colors.black38,
                      alignment: Alignment.center,
                      child: Text(
                        "测试IgnorePointer",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPointerDown: (event) {
                      print("点击IgnorePointer子Widget：$event");
                    },
                  ),
                ),
                 onPointerDown: (event) {
                  print("点击IgnorePointer:$event");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
