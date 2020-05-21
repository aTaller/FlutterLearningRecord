import 'package:flutter/material.dart';

class QiExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded'),
      ),
      body: ListView(
        children: <Widget>[
          _normalRow(),
          _normalDivider(),
          _expandedRow1(),
          _normalDivider(),
          _expandedRow2(),
          _normalDivider(),
          _expandedRow3(),
          _expandedRow32(),
          _normalDivider(),
          _expandedRow4(),
          _sectionDivider(),
          _fixedSizedBoxRow(),
          _fixedSizedBoxRow2(),
        ],
      ),
    );
  }

  Row _normalRow() {
    return Row(
      children: <Widget>[
        Text(
          '0. Normal Row',
          style: TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
        ),
        Text(
          'Right Text',
          style: TextStyle(fontSize: 32.0, backgroundColor: Colors.yellow),
        ),
      ],
    );
  }

  Row _expandedRow1() {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.blue,
          width: 212.0,
          child: Text(
            '1. ExpandedRow LeftText',
            style:
                TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
          ),
        ),
        // Expanded(
        //     child: Container(
        //   decoration: BoxDecoration(
        //       color: Colors.blueAccent,
        //       border: Border.all(style: BorderStyle.solid, color: Colors.red)),
        //   child: Center(
        //     child: Text(
        //       '蓝色Expanded',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        //   // color 不能和 decoration 同时使用
        //   // color: Colors.blueGrey,
        // )),
        Expanded(
            child: Container(
          color: Colors.red,
          height: 20.0,
        )),
        Container(
          width: 150.0,
          color: Colors.blue,
          child: Text(
            'Right Text',
            style:
                TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
          ),
        )
      ],
    );
  }

  Row _expandedRow2() {
    return Row(
      children: <Widget>[
        Container(
          width: 200.0,
          color: Colors.blue,
          child: Text(
            '2.ExpandedRowLeftText',
            maxLines: 2,
            style: TextStyle(
              fontSize: 32.0,
              backgroundColor: Colors.greenAccent,
            ),
          ),
        ),
        Expanded(
            child: Container(
          child: Center(child: Text('黄色Expanded')),
          height: 20.0,
          color: Colors.yellow,
        )),
        Text(
          'Right Text',
          style: TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
        )
      ],
    );
  }

  Row _expandedRow3() {
    return Row(
      children: <Widget>[
        Text(
          '3.LeftText',
          style: TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
        ),
        Expanded(
            flex: 2,
            child: Container(
              height: 20.0,
              color: Colors.yellow,
            )),
        Container(
          color: Colors.blue,
          width: 100.0,
          // width: 10.0,
          height: 50.0,
          child: Text(
            'C',
            style:
                TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              height: 20.0,
              color: Colors.yellow,
            )),
        Container(
          width: 100.0,
          height: 50.0,
          child: Text(
            'Right',
            style:
                TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
          ),
        ),
      ],
    );
  }

  Row _expandedRow32() {
    return Row(
      children: <Widget>[
        Container(
          width: 200.0,
          child: Text(
            '3.2 ExpandedRow LeftText',
            style:
                TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
          ),
        ),
        Expanded(
            flex: 2,
            child: Container(
              height: 20.0,
              color: Colors.yellow,
            )),
        Container(
          color: Colors.blue,
          width: 100.0,
          height: 50.0,
          child: Text(
            'C',
            style:
                TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              height: 20.0,
              color: Colors.yellow,
            )),
        Container(
          width: 50.0,
          height: 50.0,
          child: Text(
            'Right',
            style:
                TextStyle(fontSize: 20.0, backgroundColor: Colors.greenAccent),
          ),
        ),
      ],
    );
  }

  Row _expandedRow4() {
    return Row(
      children: <Widget>[
        Container(
          width: 200.0,
          color: Colors.blue,
          child: Text(
            '4.Expanded Row',
            style:
                TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              height: 20.0,
              color: Colors.yellow,
            )),
        Container(
          color: Colors.blue,
          width: 100.0,
          height: 50.0,
          child: Text(
            'C',
            style:
                TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              height: 20.0,
              color: Colors.yellow,
            )),
        Container(
          width: 50.0,
          height: 50.0,
          child: Text(
            'Right',
            style:
                TextStyle(fontSize: 20.0, backgroundColor: Colors.greenAccent),
          ),
        ),
      ],
    );
  }

  Row _fixedSizedBoxRow() {
    return Row(
      children: <Widget>[
        Container(
          child: Text(
            '5.Fill FixedSize Box',
            style:
                TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
          ),
        ),
        SizedBox(
          child: Container(
            child: Text(
              '20',
              style: TextStyle(color: Colors.white),
            ),
            width: 100.0,
            height: 50.0,
            color: Colors.red,
            // decoration: BoxDecoration(color: Colors.blue),
          ),
          width: 20.0,
        ),
        Container(
          width: 50.0,
          height: 50.0,
          child: Text(
            'Right',
            style:
                TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
          ),
        ),
      ],
    );
  }

  Row _fixedSizedBoxRow2() {
    return Row(
      children: <Widget>[
        Container(
          child: Text(
            '6.Fill FixedSize Box',
            style:
                TextStyle(fontSize: 32.0, backgroundColor: Colors.greenAccent),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
            width: 200.0,
            height: 50.0,
          ),
        ),
        // SizedBox(
        //   child: Container(
        //     child: Text(
        //       '20',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     width: 30.0,
        //     height: 50.0,
        //     color: Colors.red,
        //     // decoration: BoxDecoration(color: Colors.blue),
        //   ),
        //   width: 20.0,
        // ),
        Container(
          width: 50.0,
          height: 50.0,
          child: Text(
            'Right',
            style:
                TextStyle(fontSize: 20.0, backgroundColor: Colors.greenAccent),
          ),
          color: Colors.blue,
        ),
        SizedBox(
          child: Container(
            child: Text(
              '20',
              style: TextStyle(color: Colors.white),
            ),
            width: 30.0,
            height: 50.0,
            color: Colors.red,
            // decoration: BoxDecoration(color: Colors.blue),
          ),
          width: 20.0,
        ),
      ],
    );
  }

  Widget _normalDivider() {
    return Divider();
  }

  Widget _sectionDivider() {
    return Divider(
      height: 2.0,
      color: Colors.blue,
    );
  }
}
