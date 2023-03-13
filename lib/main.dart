import 'dart:async';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutterpod/view/status_page.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  await Firebase.initializeApp();


}


const AndroidNotificationChannel channel = AndroidNotificationChannel(
  "High_importance_channel",
  "High_importance_channel",
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

const InitializationSettings initializationSettings =
InitializationSettings(
  android: AndroidInitializationSettings("@mipmap/ic_launcher"),
);








void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Future.delayed(Duration(milliseconds: 500));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
await flutterLocalNotificationsPlugin
    .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
    ?.createNotificationChannel(channel);
flutterLocalNotificationsPlugin.initialize(
  initializationSettings,
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

