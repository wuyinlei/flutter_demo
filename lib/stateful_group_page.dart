import 'package:flutter/material.dart';

class StateFulGroupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateFulGroupState();
}

class _StateFulGroupState extends State<StatefulWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        TextStyle(fontSize: 20, color: Colors.lightGreenAccent);

    return MaterialApp(
      title: 'StatefuleWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Text('StatefuleWidget与基础组件'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            )),
        //创建底部导航栏
        bottomNavigationBar: BottomNavigationBar(
            // 当前选中的index
            currentIndex: _currentIndex,
            // tab按下的时候 更新当前选中的index
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              //底部导航栏
              BottomNavigationBarItem(
                  //默认图标
                  icon: Icon(Icons.home, color: Colors.grey),
                  //点击之后的图标
                  activeIcon: Icon(Icons.home, color: Colors.blue),
                  //标题
                  title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list, color: Colors.grey),
                  activeIcon: Icon(Icons.list, color: Colors.blue),
                  title: Text('列表'))
            ]),
        floatingActionButton:
            FloatingActionButton(onPressed: null, child: Text('点我')),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Image.network('http://www.devio.org/img/avatar.png',
                        width: 50, height: 50),
                    TextField(
                      //输入文本样式
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          hintText: '请输入文本',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey)),
                    ),
                    Container(
                      height: 200,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(color: Colors.grey),
                      child: PageView(
                        children: <Widget>[
                          _item('PageView1', Colors.blue),
                          _item('PageView2', Colors.redAccent),
                          _item('PageView3', Colors.cyan),
                          _item('PageView4', Colors.lightBlue)
                        ],
                      ),
                    )
                  ],
                ),
                //刷新方法
                onRefresh: _handleRefresh,
              )
            : Text('另外一个界面'),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
