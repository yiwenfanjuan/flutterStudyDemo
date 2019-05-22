import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class HttpDownloadDemoRoute extends StatefulWidget {
  @override
  _HttpDownloadDemoRouteState createState() {
    // TODO: implement createState
    return _HttpDownloadDemoRouteState();
  }
}

class _HttpDownloadDemoRouteState extends State<HttpDownloadDemoRoute> {
  String url = "http://download.dcloud.net.cn/HBuilder.9.0.2.macosx_64.dmg";
  String path =
      "/example/HBuilder.9.0.2.macosx_64.dmg";
  //是否正在下载
  bool isDownloading = false;
  //出错信息
  String _errorInfo = "没有错误";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("分块下载测试demo"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("点击开始测试分块下载"),
            onPressed: () {
              //点击之后开始下载
              if (!isDownloading) {
                downloadWithChunks(url, path,
                    onReceiveProgress: progressReceived);
              } else {
                print("文件正在下载");
              }
            },
          ),
          Expanded(
            flex: 4,
            child: Text(_errorInfo),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("获取到的文件路径：" + path);
  }

  //进度回调
  void progressReceived(int received, int total) {
    if (total != -1) {
      print("${(received / total * 100).floor()}%");
    }
  }

  Future downloadWithChunks(
    url,
    path, {
    ProgressCallback onReceiveProgress,
  }) async {

    String savePath = (await getApplicationDocumentsDirectory()).path;
    const firstChunkSize = 102;
    const maxChunk = 3;

    int total = 0;
    var dio = Dio();
    var progress = <int>[];

    createCallback(no) {
      return (int received, _) {
        progress[no] = received;
        if (onReceiveProgress != null && total != 0) {
          onReceiveProgress(progress.reduce((a, b) => a + b), total);
        }
      };
    }

    Future<Response> downloadChunk(url, start, end, no) async {
      print("开始下载文件:$url,$start,$end,$no,${savePath}/temp$no");
      progress.add(0);
      --end;
      return dio.download(
        url,
        "$savePath/temp$no",
        onReceiveProgress: createCallback(no),
        options: Options(headers: {"range": "bytes=$start - $end"}),
      );
    }

    Future mergeTempFiles(chunck) async {
      print("开始合并文件");
      File file = File("$savePath/temp0");
      IOSink ioSink = file.openWrite(mode: FileMode.writeOnlyAppend);
      for (int i = 1; i < chunck; i++) {
        File _f = File("$savePath/temp$i");
        await ioSink.addStream(_f.openRead());
        await _f.delete();
      }
      await ioSink.close();
      await file.rename(path);
      print("文件个并完成：${file.length()}");
    }

    Response response = await downloadChunk(url, 0, firstChunkSize, 0);
    print("请求到的数据:${response.headers},${response.statusCode}");
    if (response.statusCode == 206) {
      //支持分块下载
      int total = int.parse(
          response.headers
              .value(HttpHeaders.contentRangeHeader)
              .split("/")
              .last, onError: (errorInfo) {
        print("数据转换出错：$errorInfo");
      });

      int reserved = total -
          int.parse(response.headers.value(HttpHeaders.contentLengthHeader));
      int chunk = (reserved / firstChunkSize).ceil() + 1;

      if (chunk > 1) {
        int chunkSize = firstChunkSize;
        if (chunk > maxChunk + 1) {
          chunk = maxChunk + 1;
          chunkSize = (reserved / maxChunk).ceil();
        }

        var futures = <Future>[];
        for (int i = 0; i < maxChunk; i++) {
          int start = firstChunkSize + i * chunkSize;
          futures.add(downloadChunk(url, start, start + chunkSize, i + 1));
        }
        await Future.wait(futures);
      }
      await mergeTempFiles(chunk);
    }
  }
}
