import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/book.dart';


class DetailPage extends StatelessWidget {
final Book book;
DetailPage(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Hero(
               tag: book.title,
                child: Image.asset(book.imageUrl)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(book.title),
                      Column(
                        children: [
                          Text(book.rating),
                          Text(book.genre)
                        ],
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(book.detail),
                  ),
              SizedBox(height: 109.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Color(0xFF006E82),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                         ),
                         minimumSize: Size(150.w, 50.h)
                       ),
                         onPressed: (){}, child: Text('Read Book')
                     ),
                      SizedBox(width: 40.w,),
                      OutlinedButton(
                          onPressed: (){
                            
                          }, child: Text('More Info')
                      )

                    ],
                  )


                ],
              ),
            )

          ],
        )
    );
  }
}
