import 'package:flutter/material.dart';
/**
 * 流式布局FlowLayout的实现
 */

class FlowLayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("流式布局Flow演示"),centerTitle: true,backgroundColor: Colors.grey,),
      body: FlowLayoutTest(),
    );
  }
}

//FlowLayout布局
class FlowLayoutTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flow(
      delegate:TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: <Widget>[
        Container(width: 100,height: 100,color: Colors.red,),
        Container(width: 100,height: 100,color: Colors.blue,),
        Container(width: 100,height: 100,color: Colors.green,),
        Container(width: 100,height: 100,color: Colors.pink,),
        Container(width: 100,height: 100,color: Colors.grey,),
        Container(width: 100,height: 100,color: Colors.black,),
      ],
    );
  }
}
//对于FlowLayout，需要自己实现FlowDelegate
class TestFlowDelegate extends FlowDelegate{
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    //对widget的位置进行重绘
    var x = margin.left;
    var y =margin.top;
    //计算每一个子widget的位置
    for(int i = 0; i < context.childCount; i++){
      var w =context.getChildSize(i).width + x + margin.right;
      if(w < context.size.width){
        context.paintChild(i,transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      }else{
        x = margin.left;
        y +=context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,transform: Matrix4.translationValues(x, y, 0.0));
        x +=context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    
    return Size(double.infinity,300.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    
    return oldDelegate != this;
  }
}