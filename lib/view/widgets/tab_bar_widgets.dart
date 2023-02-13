import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../providers/movie_provider.dart';
import '../detail_page.dart';
import '../home_page.dart';



class TabBarWidget extends ConsumerWidget {
final CategoryType categoryType;
final String someKey;
TabBarWidget(this.categoryType, this.someKey);

  @override
  Widget build(BuildContext context, ref) {
    final movieData = categoryType == CategoryType.popular ? ref.watch(popularProvider) :
    categoryType == CategoryType.top_rated ? ref.watch(topRatedProvider): ref.watch(UpcomingProvider);

     if(movieData.isLoad){
       return Center(child: CircularProgressIndicator());
     }else if(movieData.isError){
       return OfflineBuilder(
           connectivityBuilder: (c, connection, child) {

             final bool connected = connection != ConnectivityResult.none;

             return connected ? Column(
               children: [
                 TextButton(onPressed: (){
                   ref.refresh(popularProvider);
                   ref.refresh(UpcomingProvider);
                   ref.refresh(topRatedProvider);
                 }, child: Text('Refresh')),
                 Text('Connection on'),
               ],
             ): Center(child: Text(movieData.errorMessage));
           },
         child: Container(),
       );
     }else{
       return Padding(
         padding: const EdgeInsets.all(10.0),
         child: NotificationListener(
           onNotification: (ScrollEndNotification onNotification) {
             final before = onNotification.metrics.extentBefore;
             final max = onNotification.metrics.maxScrollExtent;
             if (before == max) {
               if(categoryType == CategoryType.popular){
                 ref.read(popularProvider.notifier).loadMore();
               }else if(categoryType == CategoryType.top_rated){
                 ref.read(topRatedProvider.notifier).loadMore();
               }else{
                 ref.read(UpcomingProvider.notifier).loadMore();
               }


             }
             return true;
           },
           child: GridView.builder(
             key:  PageStorageKey<String>(someKey),
               itemCount: movieData.movies.length,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   childAspectRatio: 2/3,
                   crossAxisSpacing: 5,
                   mainAxisSpacing: 5,
                   crossAxisCount: 3
               ),
               itemBuilder: (context, index){
                 final movie = movieData.movies[index];
                 return InkWell(
                   onTap: (){
                     Get.to(() => DetailPage(movie));
                   },
                   child: CachedNetworkImage(
                     errorWidget: (c, s, d) => Image.asset('ass'),
                     placeholder: (c, s) => Center(child: SpinKitFadingCube(
                       color: Colors.pinkAccent,
                     )),
                     imageUrl: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2${movie.poster_path}'
                   ),
                 );
               }
           ),
         ),
       );
     }
  }
}
