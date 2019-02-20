import 'package:flutter/material.dart';
/**
 * Constainer Demo演示
 */
class  ContainerDemo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Container Demo演示"),),
      body: ContainerTest(),
    );
  }
}

//Container
class ContainerTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 50.0,left: 50.0),
      constraints: BoxConstraints.tightFor(width: 200,height: 150),
      decoration: BoxDecoration(//背景渐变
        gradient: RadialGradient(//径向渐变
          colors: [Colors.red,Colors.orange],
          center: Alignment.topLeft,
          radius: 0.98
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0
          )
        ],
      ),
      transform: Matrix4.rotationZ(0.2),//旋转
      alignment: Alignment.center,
      child: Text("Container Demo",
        style: TextStyle(color: Colors.white,fontSize: 12.0),
      ),
      
    );
  }
}