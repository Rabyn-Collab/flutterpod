import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterpod/view/search_page.dart';
import 'package:flutterpod/view/widgets/tab_bar_widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

enum CategoryType{
  popular,
  top_rated,
  upcoming
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            physics: NeverScrollableScrollPhysics(),
              tabs: [
            Tab(text: 'Popular'),
            Tab(text: 'Top Rates'),
            Tab(text: 'Upcoming'),
          ]),
          toolbarHeight: 100.h,
          flexibleSpace: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 100.h,
            child: Column(
              children: [
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tmdb Movies', style: TextStyle(fontSize: 25.sp),),
                    IconButton(onPressed: (){
                      Get.to(() => SearchPage());
                    }, icon: Icon(Icons.search, size: 30,)),
                  ],
                ),
              ],
            ),
          ),
        ),
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
              TabBarWidget(CategoryType.popular, '1'),
              TabBarWidget(CategoryType.top_rated, '2'),
              TabBarWidget(CategoryType.upcoming, '3'),
          ]
          )
      ),
    );
  }
}
