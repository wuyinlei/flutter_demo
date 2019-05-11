import 'package:flutter/material.dart';

class FlutterLayoutGroupPage extends StatefulWidget {
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
      title: '如何进行Flutter布局开发',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何进行Flutter布局开发'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          )
        ),
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
                    //行  不能换行  超出内容的将不能显示
                    Row(
                      children: <Widget>[
                        Chip(
                          avatar: Icon(Icons.people),
                          label: Text('I am Chip'),
                        ),
                        ClipOval(
                          child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.network(
                                  'http://www.devio.org/img/avatar.png',
                                  width: 50,
                                  height: 50)),
                        ),
                        Padding(
                          // 这个地方没有圆角   但是当padding达到一定程度的时候  有了圆角
                          padding: EdgeInsets.all(10),
                          child: ClipRRect(
                            //圆角
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Opacity(
                                opacity: 0.6, // 60%透明度
//                                child: new Container(
//                                  width: 100,
//                                  height: 100,
//                                  color: Colors.redAccent,
//                                )),
                                child: Image.network(
                                  'http://www.devio.org/img/avatar.png',
                                  width: 100,
                                  height: 100,
                                )),
                          ),
                        )
                      ],
                    ),
                    //也是行元素 但是可以换行
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8, //水平间距
                      runSpacing: 10, //换行间距
                      children: <Widget>[
                        Chip(
                          avatar: Icon(Icons.people),
                          label: Text('I am Chip'),
                        ),
                        Chip(
                          avatar: Icon(Icons.cached),
                          label: Text('我是菜鸟'),
                        ),
                        Chip(
                          avatar: Icon(Icons.access_alarm),
                          label: Text('你是一个小白'),
                        ),
                        Chip(
                          avatar: Icon(Icons.cake),
                          label: Text('测试一下啦'),
                        )
                      ],
                    ),
                    //列布局
                    Column(
                      textDirection: TextDirection.ltr,
                      children: <Widget>[
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey),
                            child: Text(
                              '宽度match_parent',
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                        height: 150,
                        margin: EdgeInsets.all(5),
                        //裁剪布局
                        child: PhysicalModel(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                          clipBehavior: Clip.antiAlias, //抗锯齿
                          child: PageView(
                            children: <Widget>[
                              _item("我是第一个页面", Colors.redAccent),
                              _item("我是第二个页面", Colors.redAccent),
                              _item("我是第三个页面", Colors.redAccent)
                            ],
                          ),
                        )),
                    Stack(
                      children: <Widget>[
                        Image.network('http://www.devio.org/img/avatar.png'),
                        //相对于上面的图片的位置
                        Positioned(
                          left: 0, //左边
                          bottom: 0, //底部
                          child: Image.network(
                            'http://www.devio.org/img/avatar.png',
                            width: 36,
                            height: 36,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                //刷新方法
                onRefresh: _handleRefresh,
              )
            : Column(
                children: <Widget>[
                  Text('列表'),
                  Expanded(
                      //利用Expanded 可以填满高度
                      child: Container(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Text('拉伸填满高度'),
                  ))
                ],
              ),
      ),
    );
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return null;
  }
}
