import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../providers/search_provider.dart';



class SearchPage extends ConsumerWidget {

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context, ref) {
    final searchData = ref.watch(searchProvider);
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
              TextFormField(
                controller: searchController,
                onFieldSubmitted: (val){
                  ref.read(searchProvider.notifier).searchMovie(val);
                  searchController.clear();
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: OutlineInputBorder(

                  )
                ),
              ),
                Expanded(
                    child: searchData.isLoad ? Center(child: CircularProgressIndicator())
                        : searchData.isError ? Center(child: Text(searchData.errorMessage),)
                        : GridView.builder(
                        itemCount: searchData.movies.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2/3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            crossAxisCount: 3
                        ),
                        itemBuilder: (context, index){
                          final movie = searchData.movies[index];
                          return CachedNetworkImage(
                              errorWidget: (c, s, d) => Image.asset('ass'),
                              placeholder: (c, s) => Center(child: SpinKitFadingCube(
                                color: Colors.pinkAccent,
                              )),
                              imageUrl: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2${movie.poster_path}'
                          );
                        }
                    ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
