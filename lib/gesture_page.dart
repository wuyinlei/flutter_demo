// Flutter code sample for material.AppBar.actions.1

// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

/// This is the stateless widget that the main application instantiates.
// ignore: must_be_immutable
class GesturePage extends StatefulWidget {
  String printString = '';

  GesturePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printMsg = '';

  double moveX = 0,moveY = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何检测用户手势以及处理点击事件'),
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
                  GestureDetector(
                    onTap: () => _printMsg('点击'),
                    onDoubleTap: () => _printMsg('双击'),
                    onLongPress: () => _printMsg('长按'),
                    onTapCancel: () => _printMsg('取消'),
                    onTapUp: (e) => _printMsg('松开'),
                    onTapDown: (e) => _printMsg('按下'),
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text(
                        '点我',
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ),
                  ),
                  Text(printMsg)
                ],
              ),
              Positioned(
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: (e) =>_doMove(e),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(36)
                    ),
                  ),
                ),
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

  _doMove(DragUpdateDetails e){
    setState(() {
      moveY+=e.delta.dy;
      moveX+=e.delta.dx;

    });
  }
}
