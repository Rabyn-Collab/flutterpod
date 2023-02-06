import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterpod/view/widgets/tab_bar_widgets.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            physics: NeverScrollableScrollPhysics(),
              tabs: [
            Tab(text: 'Popular'),
            Tab(text: 'Top Rated'),
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
                    IconButton(onPressed: (){}, icon: Icon(Icons.search, size: 30,)),
                  ],
                ),
              ],
            ),
          ),
        ),
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
              TabBarWidget(),
             Text('top rated'),
             Text('upcoming'),
          ]
          )
      ),
    );
  }
}
