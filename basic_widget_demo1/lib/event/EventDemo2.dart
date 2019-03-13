import 'package:flutter/material.dart';
/**
 * 事件总线demo
 */

//订阅者回调签名
typedef void EventBack(params);

//定义一个全局变量，这样在某个页面引入该文件后就可以直接使用EventBus了
var bus = EventBus();

class EventBus{
  //私有构造函数
  EventBus._internal();

  //保存单例
  static EventBus _singleton = new EventBus._internal();

  //工厂构造函数
  factory EventBus(){
    return _singleton;
  }

  //保存事件订阅者队列，key:事件名 value:对应事件的订阅序列
  Map<Object,List<EventBack>> _emap =Map<Object,List<EventBack>>();

  //添加订阅者
  /**
   * 例如某个页面需要监听用户登录的事件，就在那个页面将需要监听的事件添加进来
   */
  void add(eventName,EventBack eventBack){
    if(eventName == null || eventBack == null) return;
    //如果当前事件序列里面没有这个实例，就创建当前序列
    _emap[eventName] ??= List<EventBack>();
    _emap[eventName].add(eventBack);
  }

  //移除订阅者
  void remove(eventName,[EventBack eventBack]){
    var eventList =_emap[eventName];
    if(eventList == null) return;
    if(eventBack == null){
      _emap[eventName] = null;
    }else{
      eventList.remove(eventBack);
    }
  }

  //触发事件,事件触发后该事件所有订阅者会被调用
  void emit(eventName,[arg]){
    var eventList =_emap[eventName];
    if(eventList == null) return;
    //反向遍历，防止订阅者在回调中溢出自身带来的下标错位
    for(var i = eventList.length - 1; i > -1; i--){
      eventList[i](arg);
    }
  }
}