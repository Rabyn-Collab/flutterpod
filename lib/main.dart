import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterpod/view/home_page.dart';




void main(){
runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(411, 866),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
      return  MaterialApp(
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },

    );
  }
}



class NewSome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
