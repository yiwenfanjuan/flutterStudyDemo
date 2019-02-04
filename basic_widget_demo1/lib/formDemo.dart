import 'package:flutter/material.dart';

/**
 * Form表单测试demo
 * 通过一个登录窗口提交来演示
 */
class TestFormWidget extends StatefulWidget {
  @override
  _TestFormState createState() {
    // TODO: implement createState
    return _TestFormState();
  }
}

class _TestFormState extends State<TestFormWidget> {
  //用于监听用户名的输入框控制器
  final TextEditingController _userNameController = TextEditingController();
  //用于监听密码输入框的控制器
  final TextEditingController _passwordController = TextEditingController();
  //用户获取FormState来进行用户输入的合法性检查
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("欢迎回来"),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //登录提示
                Text(
                  "欢迎登录",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12.0,
                  ),
                ),
                //账号输入框
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _userNameController,
                    autofocus: true,
                    maxLength: 10,
                    decoration: InputDecoration(
                      hintText: "请输入您的用户名",
                      labelText: "用户名",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (userName) {
                      return userName.trim().length > 5 ? "输入正确" : "用户名不能为空";
                    },
                  ),
                ),

                //密码输入框
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "请输入您的密码",
                      labelText: "密码",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                    ),
                    maxLength: 16,
                    obscureText: true,
                    validator: (password) {
                      return password.length < 6 ? "密码长度最小是6位，请检查" : "输入正确";
                    },
                  ),
                ),

                //登录按钮
                Container(
                  child: RaisedButton(
                    child: Text(
                      "登录",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    onPressed: () {
                      //点击获取到FormState，然后手动调用validate()检查数据是否正确
                      //在这里不能通过Form.of(context),因为contetx不对，需要用Global去获取
                      if((_formKey.currentState as FormState).validate()){
                        print("登录成功");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
