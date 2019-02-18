import 'package:flutter/material.dart';
/**
 * 流式布局
 */
class WrapLayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("流式布局demo"),centerTitle: true,backgroundColor: Colors.pink,),
      body: WrapLayoutTest(),
    );
  }
}

//流式布局
class WrapLayoutTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
        //主轴方向，默认水平方向
        direction: Axis.horizontal,
        //主轴对齐方式
        alignment: WrapAlignment.start,
        //主轴间隔
        spacing: 8.0,
        //纵轴对齐方式
        runAlignment: WrapAlignment.center,
        //纵轴间隔
        runSpacing: 4.0,
        //主轴子widget的排列方式
        textDirection: TextDirection.ltr,
        //纵轴的排序方式
        verticalDirection: VerticalDirection.down,

        crossAxisAlignment: WrapCrossAlignment.end,
        children: <Widget>[
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text("A"),),
            label: Text("Hamiltion"),
          ),
          Chip(
            avatar:CircleAvatar(backgroundColor: Colors.red,child: Text("M"),),
            label: Text("Lafayette"),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.green,child: Text("H"),),
            label: Text("Mulligan"),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.grey,child: Text("J"),),
            label: Text("Laurens"),
          ),Chip(
            avatar: CircleAvatar(backgroundColor: Colors.grey,child: Text("B"),),
            label: Text("Beijing"),
          ),
        ],
    );
  }
}