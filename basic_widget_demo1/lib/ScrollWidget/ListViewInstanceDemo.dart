import 'package:flutter/material.dart';

/**
 * 一个无限加载的列表
 */
class InfinitedListViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("模拟加载列表数据"),),
      body: InfiniteListView(),
    );
  }
}


class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() {
    // TODO: implement createState
    return _InfiniteListViewState();
  }
}

class _InfiniteListViewState extends State<InfiniteListView> {
  //表尾标记
  static const loadingTag = "loading......";
  var _words = <String>[loadingTag];

  //分割线
  Widget _divider = Container(
    constraints: BoxConstraints.tightFor(height: 5.0),
    color: Colors.grey,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        if (_words[index] == loadingTag) {
          //如果当前数据不足100条，就继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _receiveData();
            //获取数据时显示Loading
            return Container(
              constraints: BoxConstraints.tightFor(height: 50.0),
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                loadingTag,
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
            );
          } else {
            //如果当前数据已经记载完成，那么就显示数据已经全部加载完成的信息
            return Container(
              constraints: BoxConstraints.tightFor(height: 50.0),
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                "没有更多了",
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            );
          }
        }

        //普通情况下返回列表的item
        return Container(
          constraints: BoxConstraints.expand(height:80.0),
          padding: EdgeInsets.only(left:16.0,right:16.0),
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              //最左边显示一个图片
              Positioned(
                left: 0,
                top: 0,
                child: Image(
                  width: 70.0,
                  height: 70.0,
                  image: NetworkImage(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551159902525&di=69a723a56a4d71f909f9f780414f43f4&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F7dd98d1001e93901650c93f176ec54e737d196f6.jpg"),
                ),
              ),
              //右边显示图片的描述
              Positioned(
               right: 0,
                child: Text("这是图片描述$index",
                  style: TextStyle(color: Colors.greenAccent,fontSize: 14.0),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return index == _words.length - 1 ? null : _divider;
      },
    );
  }

  //加载数据
  void _receiveData(){
    Future.delayed(Duration(seconds:2)).then((e){
      _words.insertAll(_words.length - 1, ["哈哈哈","安徽时","dsaljd","asdw","萨尔范德萨负担","阿萨德","阿达瓦低洼的","adawdaw"]);
      setState(() {
        //重新构建列表
      });

    },onError: (error){
      print("加载数据出错");
    });
  }
}
