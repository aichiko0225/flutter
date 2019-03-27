// TODO Implement this library.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// import 'package:http/http.dart' as http;

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  @override
  // TODO: implement key
  Key get key => super.key;

  @override
  State<StatefulWidget> createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {

  bool toggle = true;
  int index = 0;
  // List<StatelessWidget> views;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // views = [];
  }

  void _toggle() {
    setState(() {
      index ++;
      toggle = !toggle;
      // views.add(Text('Toggle One'));
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return CupertinoButton(
        onPressed: () { print("Toggle Two"); },
        child: Text('Toggle Two'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}


