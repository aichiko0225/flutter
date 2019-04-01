import 'package:flutter/material.dart';
import 'StatefulWidget.dart';

// 使用 Material 组件
// 主要文章: Widgets 总览 - Material 组件

// Flutter提供了许多widgets，可帮助您构建遵循Material Design的应用程序。
// Material应用程序以MaterialApp widget开始， 该widget在应用程序的根部创建了一些有用的widget，
// 其中包括一个Navigator， 它管理由字符串标识的Widget栈（即页面路由栈）。
// Navigator可以让您的应用程序在页面之间的平滑的过渡。 是否使用MaterialApp完全是可选的，但是使用它是一个很好的做法。



void main() {
  runApp(
    new MaterialApp(
      title: 'Flutter Tutorial',
      // home: new TutorialHome(),
      home: new ShoppingList(
        products: <Product>[
          new Product(name: 'Eggs'),
          new Product(name: 'Flour'),
          new Product(name: 'Chocolate chips'),
        ],
      ),
    )
  );
}

class TutorialHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter Tutorial',
      // home: new TutorialHome(),
      home: new ShoppingList(
        products: <Product>[
          new Product(name: 'Eggs'),
          new Product(name: 'Flour'),
          new Product(name: 'Chocolate chips'),
        ],
      ),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}


class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              
            },
          ),
          new IconButton(
            icon: new Icon(Icons.battery_unknown),
            tooltip: 'unknown',
            onPressed: null,
          ),
        ],
      ),
      //body占屏幕的大部分
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              child: MyButton(),
            ),
            new Text('hello world'),
          ],
        )  
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
  
}

// 现在我们已经从MyAppBar和MyScaffold切换到了AppBar和 Scaffold widget， 我们的应用程序现在看起来已经有一些“Material”了！
// 例如，应用栏有一个阴影，标题文本会自动继承正确的样式。我们还添加了一个浮动操作按钮，以便进行相应的操作处理。

// 请注意，我们再次将widget作为参数传递给其他widget。该 Scaffold widget 需要许多不同的widget的作为命名参数，其中的每一个被放置在Scaffold布局中相应的位置。
// 同样，AppBar 中，我们给参数leading、actions、title分别传一个widget。 这种模式在整个框架中会经常出现，这也可能是您在设计自己的widget时会考虑到一点。


class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: new Container(
        height: 36,
        padding: new EdgeInsets.all(8),
        margin: new EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(child: new Text('Engage'),)
      ),
    );
  }
  
}
