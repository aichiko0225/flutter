// Future

// Future与JavaScript中的Promise非常相似，表示一个异步操作的最终完成（或失败）及其结果值的表示。
// 简单来说，它就是用于处理异步操作的，异步处理成功了就执行成功的操作，异步处理失败了就捕获错误或者停止后续操作。
// 一个Future只会对应一个结果，要么成功，要么失败。

// 由于本身功能较多，这里我们只介绍其常用的API及特性。还有，请记住，Future 的所有API的返回值仍然是一个Future对象，所以可以很方便的进行链式调用。


class TestClass extends Object {

  //先分别定义各个异步任务
  Future<String> login(String userName, String pwd) {
      //用户登录
      return Future.delayed(new Duration(seconds: 2), () {
        return "hi world!";
      }).then((data) {
        print(data);
      });
  }
  Future<String> getUserInfo(String id) {
      
      //获取用户信息 
      return Future.delayed(new Duration(seconds: 2), () {
        return "hi world!";
      }).then((data) {
        print(data);
      });
  }
  Future saveUserInfo(String userInfo) {
      
      // 保存用户信息
      return Future.delayed(new Duration(seconds: 2), () {
        return "hi world!";
      }).then((data) {
        print(data);
      });
  }
  task() async {
    try{
      String id = await login("alice","******");
      String userInfo = await getUserInfo(id);
      await saveUserInfo(userInfo);
      //执行接下来的操作
    } catch(e){
      //错误处理   
      print(e);   
    }  
  }
}

 
var test = TestClass();



