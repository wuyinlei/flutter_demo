// Flutter code sample for material.AppBar.actions.1

// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:flutter/material.dart';
import 'package:flutter_app/stateful_group_page.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

import 'flutter_layout_page.dart';
import 'less_group_page.dart';
void main() => runApp(FlutterLayoutGroupPage());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: LessGroupPage(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  Color color = ColorUtil.color('98ee34');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ready, Set, Shop!'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // Implement navigation to shopping cart page here...
              print('Shopping cart opened.');
            },
          ),
        ],
      ),
      body:new Container(
        padding: const EdgeInsets.all(60),
        color: Colors.black26,
        alignment: Alignment.center,
        child:new Container(
          constraints: BoxConstraints(
            maxHeight: 200,
            maxWidth: 100,
            minHeight: 100,
          ),
          margin: EdgeInsets.all(20),
          color: Colors.red,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: new Text("测试代码，其实我就是想测试一下",
              style: new TextStyle(color:color,
                  fontSize: 22,backgroundColor: Colors.amber)),
        ),
      )
    );
  }
}
