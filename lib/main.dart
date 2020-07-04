import 'package:flutter/material.dart';
import 'package:flutter_hundred_case/page_scaffold.dart';

import 'case1/keep_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 100例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 100 case"),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: Text("1-10 Case"),
            children: _generateItem(context, [
              PageInfo("keep Login Page", (context) => KeepLogin()),
            ]),
          ),
        ],
      ),
    );
  }
}

class PageInfo {
  PageInfo(this.title, this.builder,
      {this.withSccaffold = true, this.padding = true});
  String title;
  WidgetBuilder builder;
  bool withSccaffold;
  bool padding;
}

List<Widget> _generateItem(BuildContext context, List<PageInfo> childrens) {
  return childrens.map<Widget>((page) {
    return ListTile(
      title: Text(page.title),
      trailing: Icon(Icons.arrow_right),
      onTap: () => _openPage(context, page),
    );
  }).toList();
}

void _openPage(BuildContext context, PageInfo page) {
  if (page.withSccaffold) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PageScaffold(
        title: page.title,
        body: page.builder(context),
        padding: page.padding,
      );
    }));
  } else {
    Navigator.push(context, MaterialPageRoute(builder: page.builder));
  }
}
