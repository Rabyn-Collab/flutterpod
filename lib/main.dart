import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterpod/view/home_page.dart';
import 'package:get/get.dart';




void main(){
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
          home: HomePage(),
          theme: ThemeData(
            fontFamily: 'Nunito',
            useMaterial3: true
          ),
          debugShowCheckedModeBanner: false,
        );
      },

    );
  }
}

