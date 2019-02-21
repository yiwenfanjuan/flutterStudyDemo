import 'package:flutter/material.dart';
/**
 * SingleScrollView
 */
class SingleScrollViewDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("SingleChildScrollView demo演示"),),
      body: SingleScrollViewTest(),
    );
  }
}

class SingleScrollViewTest extends StatelessWidget{
  String _strList = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scrollbar(
       child: SingleChildScrollView(
         padding: EdgeInsets.all(16.0),
         child: Column(
           children: _strList.split("").map((item){
            return Center(
              child: Text(
                item,
                style:TextStyle(color: Colors.orangeAccent,fontSize:14.0),
                textScaleFactor: 2.0,
              ),
            );
           }).toList(),
         ),
       ), 
    );
  }
}