import 'package:flutter/material.dart';
import 'HeroAnimationPage2.dart';
/**
 * Hero动画第一个页面
 */
class HeroAnimationRoutePage1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画第一个页面"),
      ),
      body: Center(
        child: InkWell(
          child: Hero(
            tag: "userHeadImage",
            child: ClipOval(
              child: Image.asset("icon/ic_mine_qrcode.jpg",width: 60.0,),
            ),
          ),
          onTap: (){
            //打开第二个页面
            Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return HeroAnimationRoute2();
              }
            ));
          },
        ),
      ),
    );
  }
}