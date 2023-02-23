import 'dart:async';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterpod/view/home_page.dart';
import 'package:flutterpod/view/status_page.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';


class Pos{
  final String  title;
  final String body;
  final String id;

  Pos({
    required this.title,
    required this.body,
    required this.id
});

  factory Pos.fromJson(Map<String, dynamic> json){
    return Pos(
        title: json['title'],
        body: json['body'],
        id: json['id']
    );
  }
}

final postData = FutureProvider((ref) => PostProvider.getPost());

class PostProvider{
  static final dio = Dio();
  static Future<List<Pos>> getPost() async{
    try{
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
      return (response.data as List).map((e) => Pos.fromJson(e)).toList();
    }on DioError catch(err){
      throw '${err.message}';
    }
  }
}






void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Future.delayed(Duration(milliseconds: 500));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
runApp(ProviderScope(child: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(411, 866),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
      return  GetMaterialApp(
          home: StatusPage(),
          theme:ThemeData.dark(),
          debugShowCheckedModeBanner: false,
        );
      },

    );
  }
}


class Counter extends StatelessWidget {

 StreamController<int> numbers = StreamController();

 int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<int>(
          stream: numbers.stream,
          builder: (context, snapshot) {
            return Center(child: Text(snapshot.data.toString(), style: TextStyle(fontSize: 20, color: Colors.white),));
          }
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          numbers.sink.add(number++);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

