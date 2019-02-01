/**
 * 输入框及表单 widgrt
 */

import 'package:flutter/material.dart';

//这里对于输入框我们是需要保存它的状态的，所以需要使用StatefulWidget

class TextFieldFulDemo extends StatefulWidget {
  @override
  TextFieldDemoState createState() {
    // TODO: implement createState
    return TextFieldDemoState(defaultText: "我是你爸爸");
  }
}

class TextFieldDemoState extends State<TextFieldFulDemo> {
  //定义一个InputController
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  //焦点控制
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  FocusScopeNode _focusScopeNode;

  TextFieldDemoState({String defaultText}) {
    _controller.text = defaultText;
    _controller.selection = TextSelection(
      baseOffset: _controller.text?.length > 0 ? 1 : 0,
      extentOffset: _controller.text?.length > 0 ? _controller.text?.length : 0,
    );
    //设置Theme中的颜色
  }

  @override
  Widget build(BuildContext context) {
    _phoneFocusNode.addListener(() {
      print("焦点状态改变：${_phoneFocusNode.hasFocus ? '昵称输入框获得焦点' : "昵称输入框失去焦点"}");
    });

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "欢迎注册",
          style: TextStyle(color: Colors.blueGrey),
          textScaleFactor: 1.3,
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
      ),
      primary: true,
      resizeToAvoidBottomPadding: true,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        /*
        child: Theme(
            data: Theme.of(context).copyWith(
                hintColor: Colors.red, //定义下划线颜色
                inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
                    hintStyle:
                        TextStyle(color: Colors.grey, fontSize: 14.0) //定义提示文本样式
                    )),
                    */
        child: Column(
          //靠左边对齐
          mainAxisAlignment: MainAxisAlignment.start,
          //取最大值
          mainAxisSize: MainAxisSize.max,
          textBaseline: TextBaseline.alphabetic,

          children: <Widget>[
            //用户名输入框
            TextField(
              controller: _controller,
              //设置键盘弹出框为普通文本框
              keyboardType: TextInputType.text,
              //设置键盘图标为下一个
              textInputAction: TextInputAction.next,
              //文本框内的文本样式
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500),
              //自动获取焦点
              autofocus: true,
              //关联焦点：
              focusNode: _phoneFocusNode,
              //输入完成
              onEditingComplete: () {
                print("onEditingComplete 输入完成：${_controller.text}");
                //昵称输入完成之后将焦点转移到密码输入框上面
                //这是第一种转移焦点的方式，直接指定
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },

              onSubmitted: (String str) {
                print("onSubmitted 输入完成：$str");
              },

              //设置光标
              cursorColor: Colors.blueAccent,
              cursorWidth: 3.0,
              cursorRadius: Radius.circular(0.5),

              decoration: InputDecoration(
                  labelText: "请输入昵称",
                  hintText: "3-6位字符",
                  labelStyle: TextStyle(color: Colors.brown, fontSize: 12.0)),
              maxLength: 10,
              maxLengthEnforced: false,
            ),
            //密码输入框
            TextField(
              //隐藏正在输入的文本,密码输入框
              obscureText: true,
              focusNode: _passwordFocusNode,
              keyboardType: TextInputType.text,
              controller: _passwordController,
              onSubmitted: (String password) {
                print("输入的密码：" + password);
                //当密码输入完成后首先将焦点转移到昵称上，然后再隐藏输入法
                if (_focusScopeNode == null) {
                  _focusScopeNode = FocusScopeNode();
                }
                _focusScopeNode.requestFocus(_phoneFocusNode);

                //隐藏输入法就是将所有的编辑框都失去焦点
                // _phoneFocusNode.unfocus();
                // _passwordFocusNode.unfocus();
              },
              decoration: InputDecoration(
                  labelText: "请设置密码",
                  hintText: "密码为6-16位数字和字母",
                  labelStyle: TextStyle(color: Colors.brown, fontSize: 12.0)),
              maxLength: 16,
              maxLengthEnforced: true,
            ),
            //手机号输入框
            Container(
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelText: "手机号",
                    labelStyle: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 12.0,
                      wordSpacing: 5.0,
                    ),
                    hintText: "请输入手机号",
                    hintStyle: TextStyle(
                      color: Colors.blue,
                    ),
                    //设置的border没有用效果
                    /*
                border:UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent,width: 6.0),
                  borderRadius: BorderRadius.circular(3.0)
                ),
                */
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.orangeAccent, width: 10.0),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    prefixIcon: Icon(Icons.phone)),
              ),
            ),
            //通过对父布局的样式控制来实现对TextField的样式控制
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
              
                decoration: InputDecoration(
                  labelText: "邮箱",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 16.0),
                  hintText: "请输入您的邮箱",
                  hintStyle:
                      TextStyle(color: Colors.deepPurple, fontSize: 12.0),
                  border: null, //隐藏下划线
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[700], width: 1.0)),
              ),
            ),
          ],
          /*
            )
            */
        ),
      ),
      floatingActionButton: new Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.yellow),
        child: new FloatingActionButton(
          child: new Icon(Icons.phonelink_off),
        ),
      ),
    );
  }
}
