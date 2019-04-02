import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:my_app/study/Navigator.dart';
import 'study/study1.dart';
import 'study/Material.dart';
import 'views/view1.dart';

void main() => runApp(MyApp());

SampleApp app = SampleApp();

TutorialHomeApp app1 = TutorialHomeApp();

MaterialApp app2 = new MaterialApp(title: 'Navigation Basics', home: new FirstScreen());

MaterialApp getApp() {
  return MaterialApp(
    title: 'Welcome to Flutter',
    theme: new ThemeData(          // 新增代码开始... 
      primaryColor: Colors.red,
    ),                             
    home: RandomWords(),
    routes: <String, WidgetBuilder> {
      '/a': (BuildContext context) => SampleApp(),
      '/b': (BuildContext context) => SampleApp()
    }
  ); 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return app;
    // return app1;
    return app2;
    // return getApp();
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();   // 新增本行
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });
  }
  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);  // 新增本行
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(   // 新增代码开始 ...
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ), 
      onTap: () {      // 增加如下 9 行代码...
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else { 
            _saved.add(pair); 
          } 
        });
      }, 
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[      // 新增代码开始 ...
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
          new IconButton(icon: const Icon(Icons.av_timer), onPressed: _pushStudy1),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushStudy1() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new MaterialApp(
            title: 'My app', // used by the OS task switcher
            home: new MyScaffold(),
          );
        }
      )
    );
  }
  // 新增代码开始
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
            .divideTiles(
              context: context,
              tiles: tiles,
            ).toList();
          return new Scaffold(         // 新增 6 行代码开始 ...
            appBar: new AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );                           // ... 新增代码段结束.
        },
      ),
    );
  }
}