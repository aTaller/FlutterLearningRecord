import 'package:flutter/material.dart';

class PersonalUnchangedInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('不可变更个人信息'),
      ),
      body: Center(
        child: FutureBuilder(
            // future: Future.delayed(Duration(seconds: 2),
            //     () => {'籍贯': '河北邢台', 'name': 'WYW', 'idNumber': '12345678'}),
            future: Future.delayed(
                Duration(seconds: 2),
                () => [
                      {'title': '籍贯', 'subtitle': '河北邢台'},
                      {'title': 'name', 'subtitle': 'WYW'},
                      {'title': 'idNumber', 'subtitle': '12345678'}
                    ]),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                print(snapshot.data.runtimeType);
                return ListView(
                  children: snapshot.data
                      .map<Widget>(
                          (obj) => listColumn(obj['title'], obj['subtitle']))
                      .toList(),
                );
                // return ListView(
                //   children: snapshot.data
                //       .map<Widget>((obj) => ListTile(
                //           title: Text(obj["title"]),
                //           subtitle: Text(obj["subtitle"])))
                //       .toList(),
                // );
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }

  Column listColumn(String titleStr, String subtitleStr) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(titleStr),
          subtitle: Text(subtitleStr),
          onTap: () {
            print(titleStr);
            print(subtitleStr);
          },
        ),
        Divider(
          height: 5.0,
        ),
      ],
    );
  }
}
