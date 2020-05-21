import 'package:flutter/material.dart';

class QiAnimatedContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QiAnimatedContainerState();
  }
}

class _QiAnimatedContainerState extends State {
  @override
  void initState() {
    super.initState();
  }

  bool selected = false;
  static final double containerWH = 300.0;
  static final double halfContainerWH = containerWH * 0.5;
  @override
  Widget build(BuildContext context) {
    // 注意这个selected变量的位置
    // bool selected = false;
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedContainer')),
      body: GestureDetector(
        onTap: () {
          print('动画开始');
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
              onEnd: () {
                print('动画结束');
              },
              child: DecoratedBox(
                child: FlutterLogo(size: halfContainerWH,),
                decoration: BoxDecoration(
                //TODO: borderRadius 效果
                borderRadius: selected ? BorderRadius.all(Radius.circular(25.0)) : BorderRadius.all(Radius.circular(0)),
              )),
              duration: Duration(seconds: 2),
              curve: Curves.linearToEaseOut,
              width: selected ? halfContainerWH : containerWH,
              height: selected ? containerWH : halfContainerWH,
              alignment: selected ? Alignment.topCenter : Alignment.center,
              color: selected ? Colors.purpleAccent : Colors.blueGrey),
        ),
      ),
    );
  }
}
