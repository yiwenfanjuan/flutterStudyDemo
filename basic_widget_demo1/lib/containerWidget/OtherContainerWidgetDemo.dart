import 'package:flutter/material.dart';
/**
 * 其它的容器类widget，Scaffold，AppBar等
 */

class OtherContainerWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OtherWidgetTest();
  }
}

class OtherWidgetTest extends StatefulWidget {
  @override
  _OtherWidgetTestState createState() {
    // TODO: implement createState
    return _OtherWidgetTestState();
  }
}

//创建widget的state
class _OtherWidgetTestState extends State<OtherWidgetTest>
    with SingleTickerProviderStateMixin {
  //通过全局对象获取Scaffold的State对象
  static GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  //tabBar控制器
  TabController _tabController;
  //tabBar显示的title
  List<String> titles = ["新闻", "历史", "图片"];

  _OtherWidgetTestState() {
    if (titles != null) {
      _tabController = TabController(length: titles.length, vsync: this);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.person,
          ),
          onPressed: () {
            //打开侧边栏
            _globalKey.currentState.openDrawer();
          },
        ),
        title: Text("其它容器类widget demo演示"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print("暂不支持分享");
            },
          )
        ],
        bottom: TabBar(
            controller: _tabController,
            tabs: titles.map((e) => Tab(text: e)).toList()),
      ),
      //在body中使用TabView
      body: TabBarView(
        controller: _tabController,
        children: titles.map((elem) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              elem,
              style: TextStyle(color: Colors.orange, fontSize: 160.0),
              textScaleFactor: 0.4,
            ),
          );
        }).toList(),
      ),

      drawer: LeftDrawerTest(),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          icon: Icon(Icons.add),
          color: Colors.white,
          onPressed: () {},
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),//导航栏底部打一个孔
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home),),
            SizedBox(),//中间位置空出
            IconButton(icon: Icon(Icons.business),),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,//均分空间
        ),
      ),
    );
  }
}

//左侧抽屉菜单
//一个类似于QQ的左滑菜单
class LeftDrawerTest extends StatelessWidget {
  List levelList = List(10);

  LeftDrawerTest({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        //上边显示用户信息
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://img04.sogoucdn.com/app/a/100520024/8a6732d363fb0e5a31811725baa22c21"),
                    fit: BoxFit.cover),
              ),
              alignment: Alignment.bottomLeft,
              child: Stack(
                children: <Widget>[
                  //二维码图片
                  Positioned(
                    right: 10.0,
                    top: 30.0,
                    child: Image(
                      image: AssetImage("icon/ic_mine_qrcode.jpg"),
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //用户头像和昵称
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            ClipOval(
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                placeholder:
                                    "http://img.bimg.126.net/photo/ZZ5EGyuUCp9hBPk6_s4Ehg==/5727171351132208489.jpg",
                                image:
                                    "http://img.bimg.126.net/photo/ZZ5EGyuUCp9hBPk6_s4Ehg==/5727171351132208489.jpg",
                                width: 40.0,
                                height: 40.0,
                              ),
                            ),
                            //用户昵称
                            Container(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "I Believe",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.0),
                                maxLines: 1,
                                textScaleFactor: 1.5,
                              ),
                            )
                          ],
                        ),
                        //用户等级
                        Row(
                          children: levelList.map((element) {
                            return Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Icon(
                                Icons.stars,
                                color: Colors.yellowAccent,
                                size: 15.0,
                              ),
                            );
                          }).toList(),
                        ),
                        //用户个性签名
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            "这世间所有的相遇，都是久别重逢",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //中间是相关功能区域
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(top: 20.0, left: 10.0),
              color: Colors.white,
              child: Column(
                //了解会员特权
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text("了解会员特权"),
                      ),
                    ],
                  ),
                  //qq钱包
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.wallpaper,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            "QQ钱包",
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //个性装扮
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.account_box,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            "个性装扮",
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //我的收藏
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.collections,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text("我的收藏",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.0)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //底部显示相关功能按钮
          Expanded(
            flex: 1,
            child: Container(
              constraints: BoxConstraints.expand(),
              color: Colors.white,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        Text(
                          "设置",
                          style: TextStyle(color: Colors.black, fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                  //夜间模式
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.mood,
                          color: Colors.black,
                        ),
                        Text("夜间",
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0)),
                      ],
                    ),
                  ),
                  //温度
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.movie, color: Colors.black),
                        Text("杭州",
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0))
                      ],
                    ),
                  ),
                  //留白
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
