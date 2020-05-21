import 'dart:math';

import 'package:flutter/material.dart';

class QiWrap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QiWrapState();
  }
}

class _QiWrapState extends State<QiWrap> {
  double screenWidth;
  double screenHeight;
  double oddLeftContainerW = 200.0;
  double oddRightContainerW;
  double evenLeftContainerW = 100.0;
  double evenRightContainerW;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    oddLeftContainerW = 200.0;
    oddRightContainerW = screenWidth - oddLeftContainerW;
    evenLeftContainerW = 100.0;
    evenRightContainerW = screenWidth - evenLeftContainerW;
    int index = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap'),
      ),
      body: ListView(
        children: [
          horizontalWrap(index),
        ],
      ),
    );
  }

  Wrap horizontalWrap(int index) {
    return Wrap(
      // 默认主轴为水平方向
      // direction: Axis.horizontal,
      children: <Widget>[
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
        horizontalRandomColorWrapContainer(index++),
      ],
    );
  }

  Container horizontalRandomColorWrapContainer(int index) {
    double _width = 0;
    final int typeCount = 4;
    final double _horizontalHeight = (index ~/ 2) * 20 + 200.0;

    switch (index % typeCount) {
      case 0:
        _width = oddLeftContainerW;
        break;
      case 1:
        _width = oddRightContainerW;
        break;
      case 2:
        _width = evenLeftContainerW;
        break;
      case 3:
        _width = evenRightContainerW;
        break;
      default:
    }
    return Container(
      width: _width,
      height: _horizontalHeight,
      color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
          Random().nextInt(255)),
    );
  }

  //TODO: 做一个主轴为垂直方向的例子----------------
  // Wrap vertialcalWrap(int index) {
  //   return Wrap(
  //     // 默认主轴为水平方向
  //     // direction: Axis.horizontal,
  //     children: <Widget>[
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //       horizontalRandomColorWrapContainer(index++),
  //     ],
  //   );
  // }

  // Container verticalalRandomColorWrapContainer(int index) {

  //   double _width = MediaQuery.of(context).size.width;
  //   final int typeCount = 4;
  //   final double _horizontalHeight = (index ~/ 2) * 20 + 200.0;
  //   print(index);
  //   print('水平高度');
  //   print(_horizontalHeight);

  //   switch (index % typeCount) {
  //     case 0:
  //       _width = oddLeftContainerW;
  //       break;
  //     case 1:
  //       _width = oddRightContainerW;
  //       break;
  //     case 2:
  //       _width = evenLeftContainerW;
  //       break;
  //     case 3:
  //       _width = evenRightContainerW;
  //       break;
  //     default:
  //   }
  //   return Container(
  //     width: _width,
  //     height: _horizontalHeight,
  //     color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
  //         Random().nextInt(255)),
  //   );
  // }
  // END做一个主轴为垂直方向的例子--------------------
}
