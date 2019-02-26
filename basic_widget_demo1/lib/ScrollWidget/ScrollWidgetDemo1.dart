import 'package:flutter/material.dart';
/**
 * 可滚动组件简介
 */
class ScrollWidgetDemo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

//可滚动组件
class ScrollWidgetTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scrollbar(
      child: SingleChildScrollView(
        
      ),
    );
  }
}