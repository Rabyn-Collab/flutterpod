import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterpod/view/detail_page.dart';
import 'package:get/get.dart';
import '../models/book.dart';



class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
       backgroundColor: Color(0xFFF2F5F9),
     appBar: AppBar(
       backgroundColor: Color(0xFFF2F5F9),
       elevation: 0,
       title: Text(
           'Hi John,',style: TextStyle(color: Colors.black)
       ),
       actions: [
         Icon(CupertinoIcons.search, color: Colors.black,),
         Icon(Icons.notification_add_rounded, color: Colors.black,),
         SizedBox(width: 10,)
       ],
     ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: 250.h,
              width: double.infinity,
              child: Image.asset('assets/images/book.jpg', fit: BoxFit.cover,)
            ),

            SizedBox(height: 10.h,),

            Container(
              height: 260.h,
              child: ListView.builder(
                itemCount: books.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                  final book = books[index];
                  return InkWell(
                    onTap: (){
                     Get.to(() => DetailPage(book), transition: Transition.leftToRight);
                    },
                    child: Container(
                      width: 370.w,
                      child: Padding(
                        padding:  EdgeInsets.only(right: 10, left: index == 0? 10: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              //borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                              child: Hero(
                                tag: book.title,
                                child: Image.asset(
                                  book.imageUrl,
                                  width: 150.w,height: 260.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  height: 200.h,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                    Text(book.title, style: TextStyle(fontSize: 17.sp),),
                                      Text(book.detail, style: TextStyle(fontSize: 15.sp),maxLines: 4,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(book.rating),
                                          Text(book.genre,style: TextStyle(fontSize: 14.sp),)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text('You may also like', style: TextStyle(fontSize: 17.sp),),
            ),
            Container(
              height: 250.h,
              child: ListView.builder(
                itemCount: books.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 150.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          books[index].imageUrl,
                          height: 195.h, width: 150.w, fit: BoxFit.cover,),
                        Text(books[index].title, maxLines: 1,),
                        Text(books[index].genre),
                      ],
                    ),
                  );
                  }
              ),
            )



          ],
        )
    );
  }
}

//
// import 'package:flutter/material.dart';
//
// class HomePage extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final actualHeight = height - MediaQuery.of(context).padding.top;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//         body: SafeArea(
//           child: Container(
//               child: Column(
//                 children: [
//                  Container(
//                    height: actualHeight * 0.25,
//                    color: Colors.black,
//                  ),
//                   Container(
//                     height:  actualHeight * 0.25,
//                     color: Colors.purple,
//                     child: LayoutBuilder(
//                         builder: (context, constraints){
//                           return Row(
//                             children: [
//                               Container(
//                                 color: Colors.amberAccent,
//                                 width: constraints.maxWidth * 0.5,
//                                 height: constraints.maxHeight ,
//                               )
//                             ],
//                           );
//                         }
//                     ),
//                   ),
//                   Container(
//                     height:  actualHeight * 0.25,
//                     color: Colors.redAccent,
//                   ),
//                   Container(
//                     height:  actualHeight * 0.25,
//                     color: Colors.blue,
//                   ),
//
//
//                  // Expanded(
//                  //   child: Container(
//                  //     color: Colors.black,
//                  //   ),
//                  // ),
//                  //  Expanded(
//                  //    child: Container(
//                  //      color: Colors.blueGrey,
//                  //    ),
//                  //  ),
//
//                 ],
//               )
//           ),
//         )
//     );
//   }
// }
