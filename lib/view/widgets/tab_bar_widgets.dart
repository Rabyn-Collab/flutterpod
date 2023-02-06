import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/movie_provider.dart';



class TabBarWidget extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {
    final movieData = ref.watch(popularProvider);
     if(movieData.isLoad){
       return Center(child: CircularProgressIndicator());
     }else if(movieData.isError){
       return Center(child: Text(movieData.errorMessage));
     }else{
       return Center(child: Text(movieData.movies[0].title));
     }
  }
}
