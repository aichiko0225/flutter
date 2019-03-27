import 'package:flutter/material.dart';

// Flutter Widget框架概述
// 介绍
// Flutter Widget采用现代响应式框架构建，这是从 React 中获得的灵感，中心思想是用widget构建你的UI。 
// Widget描述了他们的视图在给定其当前配置和状态时应该看起来像什么。
// 当widget的状态发生变化时，widget会重新构建UI，Flutter会对比前后变化的不同，
// 以确定底层渲染树从一个状态转换到下一个状态所需的最小更改（译者语：类似于React/Vue中虚拟DOM的diff算法）。

void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyScaffold(),
  ));
}

// 该runApp函数接受给定的Widget并使其成为widget树的根。 
// 在此示例中，widget树由两个widget:Center(及其子widget)和Text组成。
// 框架强制根widget覆盖整个屏幕，这意味着文本“Hello, world”会居中显示在屏幕上。
// 文本显示的方向需要在Text实例中指定，当使用MaterialApp时，文本的方向将自动设定，稍后将进行演示。

// 在编写应用程序时，通常会创建新的widget，这些widget是无状态的StatelessWidget或者是有状态的StatefulWidget，
// 具体的选择取决于您的widget是否需要管理一些状态。
// widget的主要工作是实现一个build函数，用以构建自身。
// 一个widget通常由一些较低级别widget组成。Flutter框架将依次构建这些widget，直到构建到最底层的子widget时，
// 这些最低层的widget通常为RenderObject，它会计算并描述widget的几何形状。

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  // Widget子类中的字段往往都会定义为"final"
  final Widget title;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 88.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
      decoration: new BoxDecoration(color: Colors.blue[50]),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null 会禁用 button
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
  
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Material 是UI呈现的“一张纸”
    return Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
  
}