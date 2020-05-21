import 'dart:math';

import 'package:flutter/material.dart';

String appBarText = '带SafeArea的页面';

class QiListViewSafeArea extends StatefulWidget {
  // 控制是否启用 safeArea
  final bool enableSafeArea;

  // --- 构造方法 1
  // QiListViewSafeArea(this.enableSafeArea);

  // 构造方法 2
  QiListViewSafeArea({Key key, this.enableSafeArea}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    if (this.enableSafeArea) {
      appBarText = '带SafeArea的页面';
      return _QiListSafeAreaState();
    } else {
      appBarText = '不带SafeArea的页面';
      return _QiListDisableSafeAreaState();
    }
  }
}

class _QiListSafeAreaState extends State<QiListViewSafeArea> {
  @override
  void initState() {
    super.initState();
  }

  Widget _randomColorContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
          Random().nextInt(255)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        tooltip: '返回上一个页面',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      // appBar: AppBar(
      //   title: Text(appBarText),
      // ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _randomColorContainer(),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('带有 SafeArea 的页面'),
              subtitle: Text('滚动的时候在头帘设备（如iPhoneX，iPhoneXSMax等）上运行，不会受设备头帘影响'),
            ),
            _randomColorContainer(),
            _randomColorContainer(),
            _randomColorContainer(),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('带有 SafeArea 的页面'),
              subtitle: Text('滚动的时候在头帘设备（如iPhoneX，iPhoneXSMax等）上运行，不会受设备头帘影响'),
            ),
            _randomColorContainer(),
            _randomColorContainer(),
            _randomColorContainer(),
            _randomColorContainer(),
          ],
        ),
      ),
    );
  }
}

class _QiListDisableSafeAreaState extends State<QiListViewSafeArea> {
  @override
  void initState() {
    super.initState();
  }

  Widget _randomColorContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
          Random().nextInt(255)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(appBarText),
      // ),
      body: ListView(
        children: <Widget>[
          _randomColorContainer(),
          _randomColorContainer(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              '不带有 SafeArea 的页面',
              style: TextStyle(color: Colors.red),
            ),
            subtitle: Text('滚动的时候在头帘设备（如iPhoneX，iPhoneXSMax等）上运行，会受设备头帘影响'),
          ),
          _randomColorContainer(),
          _randomColorContainer(),
          _randomColorContainer(),
          _randomColorContainer(),
          _randomColorContainer(),
          _randomColorContainer(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              '不带有 SafeArea 的页面',
              style: TextStyle(color: Colors.red),
            ),
            subtitle: Text('滚动的时候在头帘设备（如iPhoneX，iPhoneXSMax等）上运行，会受设备头帘影响'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        tooltip: '返回上一个页面',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
