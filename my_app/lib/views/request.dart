import 'package:http/http.dart' as http;


loadData() async {
  String dataURL = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(dataURL);
  // setState(() {
  //   widgets = json.decode(response.body);
  // });
}