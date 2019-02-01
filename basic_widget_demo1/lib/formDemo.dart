import 'package:flutter/material.dart';
/**
 * Form表单测试demo
 */
class TestFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Form表单测试",style: TextStyle(color: Colors.yellowAccent[700]),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Form(
            child: TextField(
              decoration: InputDecoration(
                hintText: "form测试"
              ),
            ),
          )
        ],
      ),
    );
  }
}