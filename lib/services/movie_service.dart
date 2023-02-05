


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutterpod/constant/constants.dart';
import '../models/movie.dart';




class MovieService {
 final Dio dio;
MovieService(this.dio);

   Future<Either<String, List<Movie>>> getMovieByCategory({required String category}) async{
    try{
       final response = await dio.get('/3/movie/$category', queryParameters: {
         'api_key': apiKey
       });
       final res = {
         'id': 1,
         'results': [
           {}
         ]
       };

     final data = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
      return Right(data);
    }on DioError catch (err){
      return Left(err.message);
    }

  }

}