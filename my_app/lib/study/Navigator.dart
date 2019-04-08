import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 导航到新页面并返回
// 大多数应用程序包含多个页面。例如，我们可能有一个显示产品的页面，然后，用户可以点击产品，跳到该产品的详情页。
// 在Android中，页面对应的是Activity，在iOS中是ViewController。而在Flutter中，页面只是一个widget！
// 在Flutter中，我们那么我们可以使用Navigator在页面之间跳转。

// 步骤
// 创建两个页面。
// 调用Navigator.push导航到第二个页面。
// 调用Navigator.pop返回第一个页面。

// 1. 创建两个页面
// 我们创建两个页面，每个页面包含一个按钮。点击第一个页面上的按钮将导航到第二个页面。点击第二个页面上的按钮将返回到第一个页面。页面结构如下：


class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

final todos = List<Todo>.generate(
    20,
    (i) => new Todo(
          'Todo $i',
          'A description of what needs to be done for Todo $i',
        ));

var listview = new ListView.builder(
  itemCount: todos.length,
  itemBuilder: (context, index) {
    return new ListTile(
      title: new Text(todos[index].title),
      onTap: () async {
        String result = await Navigator.push(context,
            new MaterialPageRoute(builder: (context) {
          return new DetailScreen(
            todo: todos[index],
          );
        }));
        showDialog(
            context: context,
            builder: (context) {
              return new AlertDialog(
                content:
                    new Text('我是AlertDialog' + '\n' + 'pop result: $result'),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: new Text('确定')),
                ],
              );
            });
      },
    );
  },
);

class DetailScreen extends StatelessWidget {
  final Todo todo;

  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: new Text('${todo.title}'),
        ),
        body: new Container(
          child: Column(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.all(16),
                child: new Text('${todo.description}'),
              ),
              new RaisedButton(
                onPressed: () {
                  // Navigate back to first screen when tapped!
                  Navigator.pop(context, '${todo.title} & ${todo.description}');
                },
                child: new Text('Go back!'),
              ),
            ],
          ),
        ));
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
      ),
      body: listview,
      // body: new Center(
      //   child: new RaisedButton(
      //     child: new Text('Launch new screen'),
      //     onPressed: () => {
      //           // Navigate to second screen when tapped!
      //           Navigator.push(
      //             context,
      //             new MaterialPageRoute(
      //                 builder: (context) => new SecondScreen()),
      //           )
      //         },
      //   ),
      // ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
            Navigator.pop(context, '123');
          },
          child: new Text('Go back!'),
        ),
      ),
    );
  }
}

// 2. 调用Navigator.push导航到第二个页面
// 为了导航到新的页面，我们需要调用Navigator.push方法。 该push方法将添加Route到由导航器管理的路由栈中！
// 该push方法需要一个Route，但Route从哪里来？我们可以创建自己的，或直接使用MaterialPageRoute。
// MaterialPageRoute很方便，因为它使用平台特定的动画跳转到新的页面(Android和IOS屏幕切换动画会不同)。
// 在FirstScreen Widget的build方法中，我们添加onPressed回调：

// 从新页面返回数据给上一个页面
// 在某些情况下，我们可能想要从新页面返回数据。例如，假设我们导航到了一个新页面，向用户呈现两个选项。当用户点击某个选项时，我们需要将用户选择通知给第一个页面，以便它能够处理这些信息！

// 我们如何实现？使用Navigator.pop ！

// 步骤
// 定义主页。
// 添加一个打开选择页面的按钮。
// 在选择页面上显示两个按钮。
// 点击一个按钮时，关闭选择的页面。
// 主页上弹出一个snackbar以显示用户的选择。
