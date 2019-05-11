import 'package:flutter/material.dart';

class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);

    return MaterialApp(
      title: "StatelessWidget与基础组件",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
            title: Text("StatelessWidget与基础组件"),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            )),
        body: Container(
          // Creates a box decoration
          decoration: BoxDecoration(color: Colors.white),
          //布局方式
          alignment: Alignment.center,
          //
          child: Column(
            //列排列
            children: <Widget>[
              Text(
                'I am Text',
                style: textStyle,
              ),
              Icon(
                Icons.android,
                size: 50,
                color: Colors.blue,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.people),
                label: Text('I am Chip'),
              ),
              Divider(
                height: 10, //容器高度，不是线的高度
                indent: 100, //左侧间距
                color: Colors.yellow,
              ),
              Card(
                //带圆角、阴影、边框等效果的卡片
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "I am Card",
                    style: textStyle,
                  ),
                ),
              ),
              AlertDialog(
                title: Text('I am AlertDialog'),
                content: Text('I am Content'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
