import 'package:flutter/material.dart';

/**
 * ListView demo
 */
class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView demo演示"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "下面是通过ListView默认构造函数生成的一个ListView",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 14.0,
                ),
              ),
              ListViewTest1(),
              Text(
                "下面是通过ListView.builder()生成的一个ListView",
                style: TextStyle(color: Colors.redAccent, fontSize: 14.0),
              ),
              ListViewTest2(),


              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text("下面是通过ListView.separated()生成的一个带有分隔器的ListView"),
              ),
              ListViewTest3(),
            ],
          ),
        ),
      ),
    );
  }
}

//使用默认构造函数构建一个ListView列表
//这种方式适合列表项较少的情况
class ListViewTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(20.0),
      children: <Widget>[
        Text("I am dedicating every day to you"),
        Text("Domestic life was never quite my style"),
        Text("When you smile, you knock me out, I fall apart"),
        Text("And I thought I was so smart")
      ],
    );
  }
}

//使用ListView.builder()构造函数构建一个ListView
//这种方式适合列表项较多/无限的情况
class ListViewTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      //禁用ListView的滚动事件，滚动交给上层View处理
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 100,
      itemExtent: 50.0, //强制高度为50.0
      itemBuilder: (context, index) {
        return Container(
          constraints: BoxConstraints.expand(),
          alignment: Alignment.center,
          color: index % 2 == 0 ? Colors.redAccent : Colors.blueAccent,
          child: Text("这是第 $index 个item"),
        );
      },
    );
  }
}

//使用ListView.separated生成一个带分隔器的ListView
class ListViewTest3 extends StatelessWidget {
  //创建两个分隔器
  Widget _divider1 = Container(
    constraints: BoxConstraints.tightFor(height: 20.0),
    color: Colors.green,
  );
  Widget _divider2 = Container(
    constraints: BoxConstraints.tightFor(height: 20.0),
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      //禁用滚动，将滚动事件交给上层View处理
      physics: new NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 20,
      separatorBuilder: (context, index) {
        return index % 2 == 0 ? _divider1 : _divider2;
      },
      itemBuilder: (context, index) {
        return Container(
          constraints: BoxConstraints.tightFor(height: 50.0),
          alignment: Alignment.center,
          color: index % 2 == 0 ? Colors.redAccent : Colors.blueAccent,
          child: Text("这是第 $index 个item"),
        );
      },
    );
  }
}
