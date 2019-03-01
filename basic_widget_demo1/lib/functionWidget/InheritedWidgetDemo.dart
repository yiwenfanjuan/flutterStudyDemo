import 'package:flutter/material.dart';
/**
 * 数据传递widget--InheritedWidget
 */

//保存数据的widget
class ShareDataWidget extends InheritedWidget {
  //保存点击次数
  int data = 0;
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  //获取子树中widget共享的数据
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //如果返回false，则子树中依赖(build函数中有调用)本widget
    //的widget的"state.didChangeDependencies"会被调用
    return oldWidget.data != data;
  }
}

//实现一个子widget，在其build方法中引用ShareDataWidget中的数据，同时，在其
//didChangeDependencies()回调中打印日志：
class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() {
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      ShareDataWidget.of(context).data.toString(),
      style: TextStyle(color: Colors.white),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会调用
    //如果build中没有依赖InheritedWidget,则此回调不会使用
    print("Dependencies change");
  }
}

//创建当前路由
class TestInheritedWidgetRoute extends StatefulWidget {
  @override
  _TestInheritedWidgetRouteState createState() {
    return _TestInheritedWidgetRouteState();
  }
}

//创建当前路由的State
class _TestInheritedWidgetRouteState extends State<TestInheritedWidgetRoute> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget demo演示"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.blueAccent,
        alignment: Alignment.center,
        child: ShareDataWidget(
          data: _count,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TestWidget(),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                  child: Text("点击"),
                  onPressed: () {
                    //每点击一次，将count自增，然后重新build，ShareDataWidget中的data将会被更新
                    setState(() {
                      return ++_count;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
