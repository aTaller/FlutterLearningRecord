import 'package:flutter/material.dart';
import 'qi_listView_safeArea.dart';

class QiSafeAreaEntrance extends StatelessWidget {
  ListTile _safeAreaListTile(BuildContext context, {bool status}) {
    void pushToSafeAreaPage(bool status) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  QiListViewSafeArea(enableSafeArea: status)));
    }

    if (status) {
      return ListTile(
        title: Text('带有 SafeArea 的页面'),
        onTap: () {
          pushToSafeAreaPage(true);
        },
      );
    } else {
      return ListTile(
        title: Text('不带 SafeArea 的页面'),
        onTap: () {
          pushToSafeAreaPage(false);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SafeArea'),
      ),
      body: ListView(
        children: <Widget>[
          _safeAreaListTile(context, status: false),
          Divider(),
          _safeAreaListTile(context, status: true),
        ],
      ),
    );
  }
}
