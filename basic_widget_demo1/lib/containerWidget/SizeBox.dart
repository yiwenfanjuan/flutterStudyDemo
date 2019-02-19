import 'package:flutter/material.dart';

/**
 * ConstrainedBox和SizeBox等
 */
class SizeBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ConstrainedBox和SizeBox demo"),
      ),
      body: SizeBoxTest(),
    );
  }
}

class SizeBoxTest extends StatelessWidget {
  //定义一个红色的没有大小的redBox
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: double.infinity, //宽度尽可能大
            minHeight: 50.0, //最小高度为50像素
          ),
          child: Container(
            height: 5.0,
            child: redBox,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child:  SizedBox(
          width: 80.0,
          height: 80.0,
          child: redBox,
        ),
        ),
       Padding(
         padding: EdgeInsets.only(top: 20.0,left: 20.0),
         child: ConstrainedBox(
           constraints: BoxConstraints(minWidth: 60.0,minHeight: 60.0),
           child: ConstrainedBox(
             constraints: BoxConstraints(minWidth: 90.0,minHeight: 20.0),
             child: redBox,
           ),
         ),
       ),
       Padding(
         padding: EdgeInsets.all(20),
         child: ConstrainedBox(
           constraints: BoxConstraints(minHeight: 20,minWidth: 90),
           child: ConstrainedBox(
             constraints: BoxConstraints(minHeight: 60,minWidth: 60),
             child: redBox,
           ),
         ),
       ),
       Padding(
         padding: EdgeInsets.only(left: 10),
         child: ConstrainedBox(
           constraints: BoxConstraints(maxWidth: 80.0,maxHeight: 80.0,minHeight: 80,minWidth: 80),
           child: ConstrainedBox(
             constraints: BoxConstraints(maxWidth: 100,maxHeight: 100,minHeight: 100,minWidth: 100),
             child: redBox,
           ),
         ),
       ),
       Padding(
         padding: EdgeInsets.only(left: 10.0,top: 10.0),
         child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0,minHeight: 100.0),
            child: UnconstrainedBox(
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth:100,minHeight: 20),
                child: redBox,
              ),
            ),
         ),
       ),
      ],
    );
  }
}
