import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

// 从互联网上获取数据

// 步骤
// 1. 添加`http` package依赖
// 2. 使用`http` package发出网络请求
// 3. 将响应转为自定义的Dart对象
// 4. 获取并显示数据

// Future<http.Response> fetchPost() {
//   return http.get('https://jsonplaceholder.typicode.com/posts/1');
// }

// 虽然发出网络请求很简单，但如果要使用原始的Future<http.Response>并不简单。
// 为了让我们可以开开心心的写代码，我们可以将http.Response转换成我们自己的Dart对象。

@JsonSerializable()
class Post {

  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

Future<Post> fetchPost() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
  final json = JsonCodec().decode(response.body); 
  return new Post.fromJson(json);
}




