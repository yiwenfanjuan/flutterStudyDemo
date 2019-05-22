import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileOperationRoute extends StatefulWidget{
  @override
  _FileOperationState createState() {
    // TODO: implement createState
    return _FileOperationState();
  }
}

//创建state
class _FileOperationState extends State<FileOperationRoute>{
  //记录点击次数
  int _counter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //读取文件中保存的点击次数
    _readCounter().then((num){
      setState(() {
       _counter = num;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("文件测试"),
      ),
      body: Container(
        child: Text("点击了$_counter 次"),
      ),
      floatingActionButton: 
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: "点我啊",
          child: Icon(Icons.add),
        )
      ,
    );
  }

  //异步获取文件
  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    //创建文件
    File saveFile = File("$dir/coqunter.txt");
    return saveFile;
  }

  //异步读取文件中保存的数据
  Future<int> _readCounter() async {
    try{
        File file = await _getLocalFile();
        //读取次数,可选参数，字符编码
        String contents =await file.readAsString();
        return int.parse(contents);
    }on FileSystemException{
      //出现异常直接返回0
      return 0;
    }
  }
  //保存点击次数到文件中
  Future<Null> _incrementCounter() async {
    setState(() {
     _counter ++; 
    });
    await (await _getLocalFile()).writeAsString("$_counter");
  }
}