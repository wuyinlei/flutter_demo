// Flutter code sample for material.AppBar.actions.1

// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:flutter/material.dart';
import 'package:flutter_app/stateful_group_page.dart';

import 'flutter_layout_page.dart';
import 'flutter_plugin.dart';
import 'gesture_page.dart';
import 'less_group_page.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
          appBar: AppBar(
            title: Text('如何创建和使用Flutter的路由和导航'),
          ),
          body: RouterNavigator()),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'plugin': (BuildContext context) => FlutterPluginPage(),
        'full': (BuildContext context) => StateFulGroupPage(),
        'layout': (BuildContext context) => FlutterLayoutGroupPage(),
        'gesture': (BuildContext context) => GesturePage()
      },
    );
  }
}

class RouterNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RouterNavigatorState();
}

class _RouterNavigatorState extends State<RouterNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text('${byName ? '' : '不'}通过路由名跳转'),
            value: byName,
            onChanged: (value) {
              setState(() {
                byName = value;
              });
            },
          ),
          _item('StatelessWidget与基础组件', LessGroupPage(), 'less'),
          _item('Flutter 包和插件的使用', FlutterPluginPage(), 'plugin'),
          _item('StatefuleWidget与基础组件', StateFulGroupPage(), 'full'),
          _item('如何进行Flutter布局开发', FlutterLayoutGroupPage(), 'layout'),
          _item('如何检测用户手势以及处理点击事件', FlutterLayoutGroupPage(), 'gesture')
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
