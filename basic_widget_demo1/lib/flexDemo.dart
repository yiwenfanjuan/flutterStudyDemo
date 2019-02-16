import 'package:flutter/material.dart';

/**
 * 弹性布局demo
 */
class FlexLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "弹性布局demo",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
      ),
      body: TestFlextLayout(),
    );
  }
}

//使用Flex和Expanded配合来实现弹性布局
class TestFlextLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                child: Text(
                  "这是占据了flex为1的空间",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  semanticsLabel: "...",
                  ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue,
                child: Text("这是占据了flex为2的空间",textAlign: TextAlign.center,),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top:20),
          child: SizedBox(
            height: 100,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                        color: Colors.green,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                    ),
                  )
              ],
            ),
          ),
        ),
        //在上一节中提到在Column中嵌套Column时，内层的Column的大小始终为其内部内容的大小，而不会填充外层Column剩余空间
        //使用弹性布局可以解决这个问题
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.grey[600],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("单纯的测试数据"),
                Text("单纯的测试数据"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
