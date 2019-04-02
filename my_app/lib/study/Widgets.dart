import 'package:flutter/material.dart';

// 基础 Widgets

// Container 一个拥有绘制、定位、调整大小的 widget。
// Row 在水平方向上排列子widget的列表。
// Column 在垂直方向上排列子widget的列表。
// Image 一个显示图片的widget
// Text 单一格式的文本
// Icon A Material Design icon.
// RaisedButton Material Design中的button， 一个凸起的材质矩形按钮
// Scaffold Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。
// Appbar 一个Material Design应用程序栏，由工具栏和其他可能的widget（如TabBar和FlexibleSpaceBar）组成。

// FlutterLogo Flutter logo, 以widget形式. 这个widget遵从IconTheme。
// Placeholder 一个绘制了一个盒子的的widget，代表日后有widget将会被添加到该盒子中

// var s = Container(child: new Placeholder(color: Colors.orange,),);

// Material Components Widgets
// App结构和导航

// Scaffold Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。

// Appbar 一个Material Design应用程序栏，由工具栏和其他可能的widget（如TabBar和FlexibleSpaceBar）组成。

// BottomNavigationBar 底部导航条，可以很容易地在tap之间切换和浏览顶级视图。
// TabBar 一个显示水平选项卡的Material Design widget。
// TabBarView 显示与当前选中的选项卡相对应的页面视图。通常和TabBar一起使用。
// MaterialApp 一个方便的widget，它封装了应用程序实现Material Design所需要的一些widget。
// WidgetsApp 一个方便的类，它封装了应用程序通常需要的一些widget。

// Drawer 从Scaffold边缘水平滑动以显示应用程序中导航链接的Material Design面板。

var image1 = new NetworkImage('url');

var iamge2 = new Image.network(
  'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
);

class ListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        new Container(
          width: 160.0,
          color: Colors.red,
        ),
        new Container(
          width: 160.0,
          color: Colors.blue,
        ),
        new Container(
          width: 160.0,
          color: Colors.green,
        ),
        new Container(
          width: 160.0,
          color: Colors.yellow,
        ),
        new Container(
          width: 160.0,
          color: Colors.orange,
        ),
      ],
    );
  }
}


// 使用长列表
// 标准的ListView构造函数适用于小列表。 为了处理包含大量数据的列表，最好使用ListView.builder构造函数。

// ListView的构造函数需要一次创建所有项目，但ListView.builder的构造函数不需要，它将在列表项滚动到屏幕上时创建该列表项。

// 1. 创建一个数据源
// 首先，我们需要一个数据源来。例如，您的数据源可能是消息列表、搜索结果或商店中的产品。大多数情况下，这些数据将来自互联网或数据库。

// 在这个例子中，我们将使用List.generate构造函数生成拥有10000个字符串的列表

final items = new List.generate(1000, (i) => {'Item $i'});

var listview2 = ListView.builder(
  scrollDirection: Axis.vertical,
  itemCount: items.length,
  itemBuilder: (contenxt, index) {
    return new ListTile(
      title: new Text('${items[index]}'),
    );
  },
);



var s = new Scaffold(
  
);




