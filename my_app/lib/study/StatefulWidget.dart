import 'package:flutter/material.dart';

// 根据用户输入改变widget
// 主要文章: StatefulWidget, State.setState

// 到目前为止，我们只使用了无状态的widget 。无状态widget从它们的父widget接收参数， 它们被存储在final型的成员变量中。 
// 当一个widget被要求构建时，它使用这些存储的值作为参数来构建widget。

// 为了构建更复杂的体验 - 例如，以更有趣的方式对用户输入做出反应 - 应用程序通常会携带一些状态。
//  Flutter使用StatefulWidgets来满足这种需求。StatefulWidgets是特殊的widget，它知道如何生成State对象，
//  然后用它来保持状态。 思考下面这个简单的例子，其中使用了前面提到RaisedButton：


class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++ _counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
        new CounterIncrementor(onPressed: _increment),
        new CounterDisplay(count: _counter)
      ],
    );
  }
  
}


// 您可能想知道为什么StatefulWidget和State是单独的对象。
// 在Flutter中，这两种类型的对象具有不同的生命周期：
// Widget是临时对象，用于构建当前状态下的应用程序，
// 而State对象在多次调用build()之间保持不变，允许它们记住信息(状态)。

// 上面的例子接受用户点击，并在点击时使_counter自增，然后直接在其build方法中使用_counter值。
// 在更复杂的应用程序中，widget结构层次的不同部分可能有不同的职责；
// 例如，一个widget可能呈现一个复杂的用户界面，其目标是收集特定信息（如日期或位置），而另一个widget可能会使用该信息来更改整体的显示。

// 在Flutter中，事件流是“向上”传递的，而状态流是“向下”传递的
// 译者语：这类似于React/Vue中父子组件通信的方式：
// 子widget到父widget是通过事件通信，而父到子是通过状态，重定向这一流程的共同父元素是State。

class CounterDisplay extends StatelessWidget {
  final int count;
  CounterDisplay({this.count});
  
  @override
  Widget build(BuildContext context) {
    return new Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {

  final VoidCallback onPressed;

  CounterIncrementor({this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('Increment'),
    );
  }
}


// 整合所有
// 让我们考虑一个更完整的例子，将上面介绍的概念汇集在一起​​。我们假设一个购物应用程序，该应用程序显示出售的各种产品，并维护一个购物车。 
// 我们先来定义ShoppingListItem：

class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);


class ShoppingListItem extends StatelessWidget {

  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different parts of the tree
    // can have different themes.  The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
    );;
  }
}


class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  // The framework calls createState the first time a widget appears at a given
  // location in the tree. If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework will re-use the State object
  // instead of creating a new State object.

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When user changes what is in the cart, we need to change _shoppingCart
      // inside a setState call to trigger a rebuild. The framework then calls
      // build, below, which updates the visual appearance of the app.

      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}


// 响应widget生命周期事件
// 在StatefulWidget调用createState之后，框架将新的状态对象插入树中，然后调用状态对象的initState。
// 子类化State可以重写initState，以完成仅需要执行一次的工作。 例如，您可以重写initState以配置动画或订阅platform services。
// initState的实现中需要调用super.initState。


var t = ListTile(title: new Text('1'));



