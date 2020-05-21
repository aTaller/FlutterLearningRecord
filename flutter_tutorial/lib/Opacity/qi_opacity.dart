import 'package:flutter/material.dart';

class QiOpacity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QiOpacityState();
  }
}

class _QiOpacityState extends State<QiOpacity> {
  @override
  void initState() {
    super.initState();
  }

  double animatedOpacityValue = 1.0;
  double animatedOpacityValue2 = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opacity'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Wrap(
                  children: <Widget>[
                    Center(
                      child: sectionTypeText('1. Opacity-Text'),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    opacityTextRow(),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                sectionTypeText('2. Opacity-Image'),
                SizedBox(
                  height: 10.0,
                ),
                Wrap(
                  children: [
                    opacityImageColumn('opacity Image:1.0', 1.0),
                    Container(
                      color: Colors.grey,
                      width: 5.0,
                      height: 180.0,
                    ),
                    opacityImageColumn('opacity Image:0.5', 0.5),
                  ],
                ),
                Wrap(
                  children: [
                    Container(
                      width: 200.0,
                      child: opacityImage2('', 0.25),
                    ),
                    Container(
                      color: Colors.grey,
                      width: 5.0,
                      height: 135.0,
                    ),
                    Container(
                      width: 200.0,
                      child: opacityImage2('', 0),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Container(
                      width: 200.0,
                      child: opacityImage2('', 1.0),
                    ),
                    Container(
                      color: Colors.grey,
                      width: 5.0,
                      height: 135.0,
                    ),
                    Container(
                      width: 200.0,
                      child: opacityImage2('', 0.5),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                sectionTypeText('3. AnimatedOpacity'),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (animatedOpacityValue == 1.0) {
                          animatedOpacityValue = 0.3;
                        } else {
                          animatedOpacityValue = 1.0;
                        }
                      });
                    },
                    child: AnimatedOpacity(
                      onEnd: () {
                        print('动画结束');
                      },
                      opacity: animatedOpacityValue,
                      duration: Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child: FlutterLogo(size: 100.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 150.0,
                  decoration: BoxDecoration(
                    gradient: animatedLinearGradient(1.0),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (animatedOpacityValue2 == 1.0) {
                          animatedOpacityValue2 = 0.3;
                        } else {
                          animatedOpacityValue2 = 1.0;
                        }
                      });
                    },
                    child: AnimatedOpacity(
                      onEnd: () {
                        print('动画结束');
                      },
                      opacity: animatedOpacityValue2,
                      duration: Duration(seconds: 2),
                      curve: Curves.linear,
                      child: FlutterLogo(size: 100.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 150.0,
                  decoration: BoxDecoration(
                    gradient: animatedLinearGradient(animatedOpacityValue2),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  LinearGradient animatedLinearGradient(double opacityValue) {
    if (opacityValue > 0.5) {
      return LinearGradient(
          colors: [Colors.green, Colors.yellow, Colors.red, Colors.blue],
          stops: [0.1, 0.5, 0.75, 1.0]);
    } else {
      return LinearGradient(
          colors: [Colors.red, Colors.blue, Colors.yellow, Colors.green],
          stops: [0.1, 0.5, 0.75, 1.0]);
    }
  }

  // opacityImageColumn
  Column opacityImageColumn(String descText, double opacityValue) {
    return Column(
      children: <Widget>[
        Container(
          width: 200.0,
          child: Column(
            children: <Widget>[
              descriptionTypeText(descText),
              opacityImageRow(opacityValue),
            ],
          ),
        ),
      ],
    );
  }

  // opacityImage2
  Image opacityImage2(String descText, double opacityValue) {
    return Image.network(
        'https://raw.githubusercontent.com/flutter/assets-for-api-docs/master/packages/diagrams/assets/blend_mode_destination.jpeg',
        color: Color.fromRGBO(255, 255, 255, opacityValue),
        colorBlendMode: BlendMode.modulate);
  }

  // OpacityImageRow
  Row opacityImageRow(double opacityValue) {
    return Row(
      children: <Widget>[
        Opacity(
          opacity: opacityValue,
          // child: FlutterLogo(size: 100.0),
          child: Image.network(
            'https://raw.githubusercontent.com/flutter/assets-for-api-docs/master/packages/diagrams/assets/blend_mode_destination.jpeg',
            width: 200.0,
          ),
        ),
      ],
    );
  }

  // OpacityImageRow
  Row opacityImageRow2() {
    return Row(
      children: <Widget>[
        Expanded(
          child: descriptionTypeText('opacity:1.0'),
        ),
        Opacity(
          opacity: 1.0,
          child: Image.network(
            'https://raw.githubusercontent.com/flutter/assets-for-api-docs/master/packages/diagrams/assets/blend_mode_destination.jpeg',
            width: 130.0,
          ),
        ),
        Expanded(
          child: descriptionTypeText('opacity:0.5'),
        ),
        Opacity(
          opacity: 0.5,
          child: Image.network(
            'https://raw.githubusercontent.com/flutter/assets-for-api-docs/master/packages/diagrams/assets/blend_mode_destination.jpeg',
            width: 130.0,
          ),
        ),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }

  // OpacityTextRow
  Row opacityTextRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        Opacity(
          opacity: 1.0,
          child: Container(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Opacity: 1.0',
              style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.blue,
                  fontSize: 24.0),
            ),
          ),
          // child: Text('Opacity:1.0'),
        ),
        Expanded(
          child: SizedBox(),
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            'Opacity: 0.5',
            style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.blue,
                fontSize: 24.0),
          ),
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }

  Text sectionTypeText(String text) {
    return Text(
      text,
      style: TextStyle(
          // color: Colors.white, backgroundColor: Colors.purple,
          fontSize: 32.0),
    );
  }

  Text descriptionTypeText(String text) {
    return Text(
      text,
      style: TextStyle(
          // color: Colors.white,
          // backgroundColor: Colors.purpleAccent,
          fontSize: 24.0),
    );
  }
}
