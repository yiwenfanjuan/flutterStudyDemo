//线性布局测试demo
import 'package:flutter/material.dart';

//线性布局测试
class TestLinearLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局测试"),
        centerTitle: true,
      ),
      body: LinearLayoutInfo(),
    );
  }
}

class LinearLayoutInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      //对于Column来说：主轴表示的是垂直方向，纵轴表示的是水平方向,纵轴方向默认填充可用的最大空间
      //主轴（垂直方向）大小，使用内容大小，当值为max时使用可用的最大空间
      mainAxisSize: MainAxisSize.max,
      //主轴（垂直方向）对齐方式：当使用主轴大小为min时不起作用
      mainAxisAlignment: MainAxisAlignment.center,

      //Column有效，表示竖直方向的排列方式，up表示从下到上，所以下面的布局先显示头像再显示用户名,down表示从上到下
      verticalDirection: VerticalDirection.up,

      //纵轴方向对齐方式：对于Column来说即为水平方向的对齐方式
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //用户名信息
        Row(
          //对于Row来说，主轴表示的是水平方向
          //主轴（水平方向）的对齐方式，居中对齐
          mainAxisAlignment: MainAxisAlignment.center,
          //纵轴方向的对齐方式（对于Row来说即为垂直方向的对齐方式）
          crossAxisAlignment: CrossAxisAlignment.center,
          //Row有效，水平方向的排序方式，ltr表示从左到右,rtl表示从右到左，所以下面的子Widget先显示userName再显示用户名：
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Text(
              "用户名：",
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            Text(
              "userName",
              style: TextStyle(
                color: Colors.green,
                fontSize: 10,
              ),
            )
          ],
        ),

        //头像信息
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "头像",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
            Icon(
              Icons.person,
            )
          ],
        ),
        Text("没我什么事"),
        //在Column中再嵌套一个Column，那么里面的Column占用的空间永远是需要的空间大小,而不是最大大小，Row中嵌套Row也是如此
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("单纯的测试0"),
            Text("单纯的测试1"),
            Text("单纯的测试2"),
          ],
        )
      ],
    );
  }
}
