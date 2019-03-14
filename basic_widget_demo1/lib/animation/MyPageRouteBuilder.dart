import 'package:flutter/material.dart';

class MyPageRouteBuilder extends PageRoute{
  final WidgetBuilder builder;
  
  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissble;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  MyPageRouteBuilder({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissble = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    /*
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
    */
    //当前路由被激活，时打开新路由，执行动画
    if(isActive){
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    }else{
      //是返回当前页面，不使用动画
      return Padding(padding: EdgeInsets.zero,);
    }
  }

}