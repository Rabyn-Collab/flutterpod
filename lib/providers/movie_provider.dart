import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpod/models/movie_state.dart';

import '../api.dart';
import '../services/movie_service.dart';


final defaultState = MovieState(
    isLoad: false,
    isError: false,
    errorMessage: '',
    movies: []
);

final popularProvider = StateNotifierProvider<PopularMovie, MovieState>((ref) => PopularMovie(defaultState));
final topRatedProvider = StateNotifierProvider<TopRatedMovie, MovieState>((ref) => TopRatedMovie(defaultState));
final UpcomingProvider = StateNotifierProvider<UpcomingMovie, MovieState>((ref) => UpcomingMovie(defaultState));

class PopularMovie extends StateNotifier<MovieState>{
  PopularMovie(super.state ){
    getMovieByCategory();
  }

  Future<void> getMovieByCategory() async{
    state = state.copyWith(isLoad: true, isError: false);
    final response = await MovieService.getMovieByCategory(api: Api.popularMovie, page: 1);
    response.fold(
            (l) {
              state = state.copyWith(isLoad: false, isError: true, errorMessage: l);
            },
            (r){
              state = state.copyWith(isLoad: false, isError: false, movies: r);
            }
    );
  }

}



class TopRatedMovie extends StateNotifier<MovieState>{
  TopRatedMovie(super.state );

  Future<void> getMovieByCategory() async{
    state = state.copyWith(isLoad: true, isError: false);
    final response = await MovieService.getMovieByCategory(api: Api.topRatedMovie, page: 1);
    response.fold(
            (l) {
          state = state.copyWith(isLoad: false, isError: true, errorMessage: l);
        },
            (r){
          state = state.copyWith(isLoad: false, isError: false, movies: r);
        }
    );
  }

}



class UpcomingMovie extends StateNotifier<MovieState>{
  UpcomingMovie(super.state );

  Future<void> getMovieByCategory() async{
    state = state.copyWith(isLoad: true, isError: false);
    final response = await MovieService.getMovieByCategory(api: Api.upcomingMovie, page: 1);
    response.fold(
            (l) {
          state = state.copyWith(isLoad: false, isError: true, errorMessage: l);
        },
            (r){
          state = state.copyWith(isLoad: false, isError: false, movies: r);
        }
    );
  }

}