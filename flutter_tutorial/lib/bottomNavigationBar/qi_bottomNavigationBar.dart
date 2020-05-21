import 'package:flutter/material.dart';

class QiBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomAppBarFloationActionButton'),
      ),
      body: Center(
        child: Text(
          'BottomAppBar FloationActionButton',
          style: TextStyle(
            fontSize: 36.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // child: Text('FAB'),
        child: Icon(Icons.add),
        onPressed: () {
          print('点击FAB');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => QiIssueAnVideo(),
                  fullscreenDialog: true));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Container(
          height: 44.0,
        ),
      ),
    );
  }
}

class QiIssueAnVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布'),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          minChildSize: 0.8,
          initialChildSize: 0.9,
          maxChildSize: 0.95,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: TextField(
                      maxLines: 10,
                      decoration: InputDecoration(
                        filled: true,
                        hoverColor: Colors.grey[200],
                        hintText: '请输入要发布的内容',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(child: Container()),
                      GestureDetector(
                        child: Text(
                          '保存',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          print('保存');
                        },
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// return Container(
//               child: TextField(
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.grey,
//               hintText: '请输入要发布的内容',
//             ),
//             maxLines: 10,
//           ),
