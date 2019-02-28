import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
/**
 * 使用StaggeredGridView实现Size不同的widget排列
 */
class StaggeredGridViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

class StaggeredGridViewTest extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StaggeredGridView.count(
        crossAxisCount: 20,

    );
  }
}