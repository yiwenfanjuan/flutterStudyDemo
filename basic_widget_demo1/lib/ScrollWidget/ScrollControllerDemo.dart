import 'package:flutter/material.dart';

/**
 * 滚动控制
 * ScrollController
 */
class ScrollControllerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制ScrollController"),
      ),
      body: ScrollControllerTest(),
    );
  }
}

class ScrollControllerTest extends StatefulWidget {
  @override
  ScrollControllerTestState createState() {
    // TODO: implement createState
    return ScrollControllerTestState();
  }
}

class ScrollControllerTestState extends State<ScrollControllerTest> {
  ScrollController _controller = ScrollController();

  //是否显示回到顶部按钮，默认不显示
  bool _showBackTop = false;

  void initData() {
    _controller.addListener(scrollInfo);
  }

  //监听滚动执行的操作
  void scrollInfo() {
    //print("滚动位置${_controller.offset}");
    //读取所有的滚动位置
    for (var i = 0; i < _controller.positions.length; i++) {
      print(
          "第$i个Scrollable widget的滚动位置:${_controller.positions.elementAt(i).pixels}");
    }

    //使用forEach循环
    _controller.positions.forEach((index) {
      print("${index.runtimeType}的滚动位置:${index.pixels}");
    });

    if (_controller.offset < 1000 && _showBackTop) {
      setState(() {
        _showBackTop = false;
      });
    } else if (_controller.offset >= 1000 && !_showBackTop) {
      setState(() {
        _showBackTop = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    initData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //为了避免内存泄漏，需要调用controller的dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(),
          color: Colors.grey,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            reverse: false,
            itemCount: 100,
            controller: _controller,
            separatorBuilder: (context, index) {
              return Container(
                constraints: BoxConstraints.tightFor(height: 8.0),
                color: index % 2 == 0 ? Colors.grey : Colors.white,
              );
            },
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                color: Colors.redAccent,
                child: Text(
                  "这是第$index个item",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              );
            },
          ),
        ),
        Positioned(
            right: 20.0,
            bottom: 20.0,
            child: Container(
                constraints: BoxConstraints.tightFor(),
                color: Colors.white,
                child: !_showBackTop
                    ? null
                    : IconButton(
                        icon: Icon(Icons.arrow_upward),
                        iconSize: 40.0,
                        color: Colors.blue,
                        onPressed: () {
                          //返回到顶部
                          _controller.animateTo(0.0,
                              duration: Duration(seconds: 2),
                              curve: Curves.ease);
                        },
                      )))
      ],
    );
  }
}
