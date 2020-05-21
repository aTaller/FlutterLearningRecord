import 'package:flutter/material.dart';
import 'SafeArea/qi_safeAreaEntrance.dart';
import 'Expanded/qi_expanded.dart';
import 'Wrap/qi_warp.dart';
import 'AnimatedContainer/qi_AnimatedContainer.dart';
import 'Opacity/qi_opacity.dart';
import 'FutureBuilder/qi_futureBuilder.dart';
import 'bottomNavigationBar/qi_bottomNavigationBar.dart';

// 业务代码
import 'PersonalInfo/qi_personalInfo.dart';

enum LearningWidgetType {
  SafeArea,
  Expanded,
  Wrap,
  AnimatedContainer,
  Opacity,
  FutureBuilder,
  UnchangedPersonalInfo,
  BottomNavigationBar,
}

// 导航栏Key内容
const HomeAppBarKeyString = 'HomeAppBarKeyString';
const HomeFloationActionButtonKeyString = 'HomeFloationActionButtonKeyString';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter 学习记录'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          key: Key(HomeFloationActionButtonKeyString),
          child: Icon(Icons.add),
          onPressed: () {
            print('FloationActionButton点击');
          }),
      appBar: AppBar(
        key: Key(HomeAppBarKeyString),
        title: Text(widget.title),
      ),
      // body: Center(child: otherColumn(),),
      body: ListView(
        children: <Widget>[
          _sectionTypeListTile('SafeArea',
              widgetType: LearningWidgetType.SafeArea),
          _normalDivider(),
          _sectionTypeListTile('Expanded',
              widgetType: LearningWidgetType.Expanded),
          _normalDivider(),
          _sectionTypeListTile('Wrap', widgetType: LearningWidgetType.Wrap),
          _normalDivider(),
          _sectionTypeListTile('AnimatedContainer',
              widgetType: LearningWidgetType.AnimatedContainer),
          _normalDivider(),
          _sectionTypeListTile('Opacity',
              widgetType: LearningWidgetType.Opacity),
          _normalDivider(),
          _sectionTypeListTile('FutureBuilder',
              widgetType: LearningWidgetType.FutureBuilder),
          _normalDivider(),
          _sectionTypeListTile('UnchangedPersonalInfo',
              widgetType: LearningWidgetType.UnchangedPersonalInfo),
          _sectionTypeListTile('BottomNavigationBar',
              widgetType: LearningWidgetType.BottomNavigationBar),
        ],
      ),
    );
  }
  // Column _normalColumn() {
  //   return Column(
  //     children: <Widget>[
  //       Text(
  //         '1. Left Text',
  //         style: TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
  //       ),
  //       Text(
  //         'Right Text',
  //         style: TextStyle(fontSize: 32.0, backgroundColor: Colors.yellow),
  //       ),
  //     ],
  //   );
  // }

  // Column _expandedColumn() {
  //   return Column(
  //     children: <Widget>[
  //       Text(
  //         '2. Left Text',
  //         style: TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
  //       ),
  //       Expanded(
  //           child: Container(
  //         decoration: BoxDecoration(
  //             color: Colors.blueAccent,
  //             border: Border.all(style: BorderStyle.solid, color: Colors.red)),
  //         child: Center(
  //           child: Text(
  //             '蓝色Expanded',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //         // color 不能和 decoration 同时使用
  //         // color: Colors.blueGrey,
  //       )),
  //       Text(
  //         'Right Text',
  //         style: TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
  //       )
  //     ],
  //   );
  // }

  // Column otherColumn() {
  //   return Column(children: <Widget>[
  //     Container(
  //       color: Colors.blue,
  //       height: 100,
  //       width: 100,
  //     ),
  //     Expanded(
  //       child: Container(
  //         color: Colors.amber,
  //         width: 100,
  //       ),
  //     ),
  //     Container(
  //       color: Colors.blue,
  //       height: 100,
  //       width: 100,
  //     ),
  //   ]);
  // }

  // Column _expandedColumn2() {
  //   return Column(
  //     children: <Widget>[
  //       Container(
  //         width: 100.0,
  //         height: 100.0,
  //         child: Text(
  //           '3. Left Text',
  //           style:
  //               TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
  //         ),
  //       ),
  //       Expanded(
  //           child: Container(
  //         child: Center(child: Text('黄色Expanded')),
  //         // height: 20.0,
  //         width: 20.0,
  //         color: Colors.yellow,
  //       )),
  //       Container(
  //         width: 100.0,
  //         height: 100.0,
  //         child: Text(
  //           'Right Text',
  //           style:
  //               TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
  //         ),
  //       )
  //     ],
  //   );
  // }

  Widget _sectionTypeListTile(String title, {LearningWidgetType widgetType}) {
    return ListTile(
      title: Text(
        '${widgetType.index}. $title',
        style: TextStyle(
            backgroundColor: Colors.grey,
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontSize: 32.0),
      ),
      onTap: () {
        switch (widgetType) {
          case LearningWidgetType.SafeArea:
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => QiSafeAreaEntrance()));
            }
            break;
          case LearningWidgetType.Expanded:
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => QiExpanded()));
            }
            break;
          case LearningWidgetType.Wrap:
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => QiWrap()));
            break;
          case LearningWidgetType.AnimatedContainer:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => QiAnimatedContainer()));
            break;
          case LearningWidgetType.Opacity:
            {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QiOpacity()));
            }
            break;
          case LearningWidgetType.FutureBuilder:
            {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QiFutureBuilder()));
            }
            break;
          case LearningWidgetType.UnchangedPersonalInfo:
            {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PersonalUnchangedInfo()));
            }
            break;
          case LearningWidgetType.BottomNavigationBar:
            {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QiBottomNavigationBar()));
            }
            break;
          default:
        }
      },
    );
  }

  Widget _normalDivider() {
    return Divider();
  }
}
