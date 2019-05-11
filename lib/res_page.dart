// Flutter code sample for material.AppBar.actions.1

// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

/// This is the stateless widget that the main application instantiates.
// ignore: must_be_immutable
class ResPage extends StatefulWidget {
  String printString = '';

  ResPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GesturePageState();
}

class _GesturePageState extends State<ResPage> {
  String printMsg = '';

  double moveX = 0, moveY = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何导入和使用Flutter的资源文件？'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('images/coin_compared_disabled.png'),
                    width: 50,
                    height: 50,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _printMsg(String s) {
    setState(() {
      printMsg += s;
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveY += e.delta.dy;
      moveX += e.delta.dx;
    });
  }
}
