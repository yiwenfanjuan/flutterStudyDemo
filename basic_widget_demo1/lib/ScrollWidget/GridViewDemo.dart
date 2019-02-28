import 'package:flutter/material.dart';

/**
 * GridView demo
 */
class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView demo 测试"),
      ),
      body: GridViewTest4(),
    );
  }
}

class GridViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      padding: EdgeInsets.all(10.0),
      //垂直滚动
      scrollDirection: Axis.vertical,
      //是否反转数据集合
      reverse: false,
      //controller不指定
      primary: true,
      //指定GridView的排列方式
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //横轴3个widget
        childAspectRatio: 1.0, //长款比为1:1，子widget
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(),
          child: Icon(Icons.ac_unit),
          color: Colors.blue,
        ),
        Container(
          constraints: BoxConstraints.expand(),
          child: Icon(Icons.airport_shuttle),
          color: Colors.blue,
        ),
        Container(
          constraints: BoxConstraints.expand(),
          child: Icon(Icons.all_inclusive),
          color: Colors.blue,
        ),
        Container(
          constraints: BoxConstraints.expand(),
          child: Icon(Icons.beach_access),
          color: Colors.blue,
        ),
        Container(
          constraints: BoxConstraints.expand(),
          child: Icon(Icons.cake),
          color: Colors.blue,
        ),
        Container(
          constraints: BoxConstraints.expand(),
          child: Icon(Icons.free_breakfast),
          color: Colors.blue,
        ),
      ],
    );
  }
}

class GridViewTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}

class GridViewTest2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100.0
      ),
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}

class GridViewTest3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
      maxCrossAxisExtent: 100.0,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}

class GridViewTest4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      itemCount: 100,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.2,
    
      ),
      itemBuilder: (context,index){
        return Container(
          constraints: BoxConstraints.expand(),
          alignment: Alignment.center,
          color: index % 2== 0 ? Colors.white : Colors.grey,
          child: Text("这是第$index个方块"),
        );
      },
    );
  }
}