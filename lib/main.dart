import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterpod/view/home_page.dart';
import 'package:flutterpod/view/status_page.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';




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

