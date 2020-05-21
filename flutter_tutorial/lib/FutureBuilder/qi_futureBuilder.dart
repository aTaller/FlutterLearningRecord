import 'package:flutter/material.dart';
// import 'dart:io';
import 'package:dio/dio.dart';

class QiFutureBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QiFutureBuilderState();
  }
}

class _QiFutureBuilderState extends State<QiFutureBuilder> {
  bool startNetRequest = false;
  @override
  void initState() {
    super.initState();
  }

  Widget textOrNetworkWidget() {
    if (!startNetRequest) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'FutureBuilder',
              style: TextStyle(fontSize: 64.0),
            ),
            Text('尚未开始网络请求'),
          ],
        ),
      );
    }
    return Center(
      child: SafeArea(
        child: FutureBuilder(
            // future: Future.delayed(Duration(seconds: 2),()=> {'name': 'ITWYW', 'full_name': 'ITWYW'},),
            future: Dio().get('https://api.github.com/orgs/flutterchina/repos'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Response response = snapshot.data;
                // 请求结果有误，显示错误信息
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                // 显示请求结果
                return ListView(
                  children: response.data
                      .map<Widget>((obj) => ListTile(
                          title: Text(obj["name"]),
                          subtitle: Text(obj["full_name"])))
                      .toList(),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {

              } else if (snapshot.connectionState == ConnectionState.none) {
                
              }
              // 请求过程中返回进度指示器
              return CircularProgressIndicator(
                strokeWidth: 10.0,
                semanticsLabel: '请稍候...',
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder'),
        actions: <Widget>[
          FlatButton(
            color: Colors.purple,
            child: Text(
              '点击加载网络请求',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if (!mounted) return;
              setState(() {
                startNetRequest = !startNetRequest;
              });
            },
          ),
        ],
      ),
      body: textOrNetworkWidget(),
      floatingActionButton: FloatingActionButton(
          child: Text('返回'),
          onPressed: () {
            Navigator.of(context).pop();
          }),
      
    );
  }
}
