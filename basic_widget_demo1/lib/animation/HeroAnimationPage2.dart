import 'package:flutter/material.dart';
/**
 * Hero动画第二个页面
 */
class HeroAnimationRoute2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画第二个页面"),
      ),
      body: Hero(
        tag: "userHeadImage",
        child: Image.asset("icon/ic_mine_qrcode.jpg",width: 200.0,),
      ),
    );
  }
}