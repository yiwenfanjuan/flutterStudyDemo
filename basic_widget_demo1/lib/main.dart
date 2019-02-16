import 'package:flutter/material.dart';
import 'normal_app_bar.dart';
import "package:english_words/english_words.dart";
import 'textFieldDemo.dart';
import 'formDemo.dart';
import 'lineLayoutDemo.dart';
import 'flexDemo.dart';

/**
 * fluter 基础组件 demo1
 */
//void main() => runApp(TabbedAppBarSample());

//测试TextFiels
//void main() => runApp(TextFieldDemo());

//首页，路由管理
main() => runApp(RouteTestWidget());

//路由管理test,通过当前页面的按钮跳转到另一个页面
class RouteTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: TestRouteWidget1(),
    );
  }
}

class TestRouteWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Main Page",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text("跳转到TestTextField页面"),
            textColor: Colors.lightGreenAccent,
            textTheme: ButtonTextTheme.accent,
            onPressed: () {
              print("点击跳转到TestTextField页面");
            
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return TextFieldFulDemo();
              }));
            
            },
          ),
          RaisedButton(
            child: Text("Form表单测试"),
            onPressed: (){
              //跳转到表单测试页面
              Navigator.push(context, 
                MaterialPageRoute(builder: (context){
                  return TestFormWidget();
                }));
            },
          ),
          RaisedButton(
            child: Text("线性布局测试"),
            onPressed: (){
              //跳转到线性布局测试页面
              Navigator.push(context, MaterialPageRoute(builder: (context){
                  return TestLinearLayout();
              }));
            },
          ),
          RaisedButton(
            child: Text("弹性布局测试"),
            onPressed: (){
              //点击跳转到弹性布局测试页面
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return FlexLayoutDemo();
              }));
            },
          ),
        ],
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

/**
 * Container widget,下面的例子演示了在中心位置放置一个绿色的小部件，同时设置了它的margin属性
 * 为了验证margin的效果，特意设置了四个方向的margin不一样
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(100, 100, 0, 0),
        color: Colors.greenAccent,
        width: 48.0,
        height: 48.0,
      ),
    );
  }
}

/**
 * 下面的例子演示了更多container的更多属性
 */
class TestContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      color: Colors.redAccent,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container test demo"),
        ),
        body: Container(
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200,
            ),
            padding: EdgeInsets.all(10.0),
            color: Colors.teal.shade700,
            //前景装饰，这个装饰会直接覆盖其下面的内容
            foregroundDecoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "https://ss0.baidu.com/7Po3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=8a22036b5cda81cb51e685cd6267d0a4/4bed2e738bd4b31ca04d7f248ad6277f9e2ff838.jpg"),
            )),
            transform: Matrix4.rotationZ(0.2),
            child: Text(
              "Hello World",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.redAccent),
            )),
      ),
    );
  }
}

//Row:在水平方向上排列子widget
class TestRow1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("TestRow"),
      ),
      body: Row(
        children: <Widget>[
          //第一个子元素
          Expanded(
            child: Text(
              "Deliver features faster",
              textAlign: TextAlign.center,
            ),
          ),
          //第二个子元素
          Expanded(
            child: Text(
              "Craft beautiful UIs",
              textAlign: TextAlign.center,
            ),
          ),
          //第三个子元素
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    ));
  }
}

//在上面的关于Raw的测试中，我们使用了Expanded作为了Row的子元素，这样做的好处是宽度不会溢出屏幕，当内容的宽度超过可用宽度时，就会自动缩进到下一行（对于文本）
//下面演示不使用Expanded的效果
//对于Row这个widget，理论上应该是在一行显示元素，后一个元素在前一个元素的右边，但是当Row的宽度不能适应内容的宽度的时候，就会出现问题，例如下面的例子
//最后会出现一个黄黑相间的条纹，用来表示这一块视图有问题，同时出现right overflowed的指示
class TestRow2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TestRow2"),
          centerTitle: true,
        ),
        body: Row(
          children: <Widget>[
            const FlutterLogo(),
            const Text(
                "Flutter's hot reload helps you quickly and easily experiment,build UIs,and fix bug faster,Experience sub-second reload times,without losing state,on emulators,simulators,and hardware for IOS and Android"),
            const Icon(Icons.access_alarm),
          ],
        ),
      ),
    );
  }
}
//对于如何修复上面出现的问题，只需要将第二个元素使用Expanded包裹就没问题了，这样第二个元素会自动换行

class TestRow3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TestRow2"),
          centerTitle: true,
        ),
        body: Row(
          children: <Widget>[
            const FlutterLogo(),
            const Expanded(
                child: Text(
                    "Flutter's hot reload helps you quickly and easily experiment,build UIs,and fix bug faster,Experience sub-second reload times,without losing state,on emulators,simulators,and hardware for IOS and Android")),
            const Icon(Icons.access_alarm),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}

//column:在数值方向上排列子元素
class TestColumn1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "testColumn1",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            const FlutterLogo(
              size: 100,
            ),
            const Text(
                "Flutter's hot reload helps you quickly and easily experiment,build UIs,and fix bug faster,Experience sub-second reload times,without losing state,on emulators,simulators,and hardware for IOS and Android"),
            const Icon(
              Icons.access_alarms,
              color: Colors.lightGreen,
              size: 200,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.ideographic,
          verticalDirection: VerticalDirection.up, //从下到上布局
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}

//下面的例子演示一个竖直排列的widget，最后一个元素将会填充剩下的所有控件
class TestColumn2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("testColumn2"), centerTitle: true),
        body: Column(
          children: <Widget>[
            const Text("first row"),
            const Text("second row"),
            Image.network(
              "https://ss0.baidu.com/7Po3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=8a22036b5cda81cb51e685cd6267d0a4/4bed2e738bd4b31ca04d7f248ad6277f9e2ff838.jpg",
              scale: 1.7,
              fit: BoxFit.fitWidth,
            ),
            const Expanded(
              flex: 10,
              child: FittedBox(
                child: Text("third row"),
                fit: BoxFit.contain,
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}

//Text相关
//创建一个简单的Text
class ShowTextInfo extends StatelessWidget {
  final String name;
  ShowTextInfo(this.name);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text(
            "TestTextDemo1",
            style: TextStyle(color: Colors.redAccent),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Text(
                "$name,How are you?",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  inherit: false,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.2,
                  wordSpacing: 4.0, //单词之间的间距,对汉字没用
                ),
                textAlign: TextAlign.right, //文字被放置的位置
                textDirection:
                    TextDirection.ltr, //默认从左向右，这里修改为从右向左，right to left
                locale: Locale.fromSubtags(languageCode: "CH"),
                softWrap: true,
                overflow: TextOverflow.ellipsis, //超过限制的展示方式,ellipsis是超出之后使用省略号
                textScaleFactor: 2,
                maxLines: 1,
                semanticsLabel: "abi",
              ),
            ),
            //使用富文本，可以对一段文字中的某一些单词做专门的处理
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        style: TextStyle(color: Colors.cyanAccent),
                        text: "$name \n"),
                    TextSpan(
                        style: TextStyle(color: Colors.deepPurple),
                        text: " How are you?"),
                  ],
                ),
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//使用Icon
class TestIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TestIconDemo"),
        ),
        body: Icon(
          Icons.access_time,
          size: 50,
        ),
      ),
    );
  }
}
