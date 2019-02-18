import 'package:flutter/material.dart';
/**
 * 层叠布局演示
 */
class StackLayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("层叠布局演示"),centerTitle: true,backgroundColor: Colors.indigo,primary: true,automaticallyImplyLeading: false,),
      body: StackLayoutTest(),
    );
  }
}

//层叠布局
class StackLayoutTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        //指定未定位或部分定位widget的对齐方式
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
           Positioned(
            left:18.0,
            child: Text("I am Jack"),
          ),

          Container(
            child: Text("HelloWorld",style:TextStyle(color:Colors.white)),
            color: Colors.red,
          ),
         
          Positioned(
            top: 180.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}