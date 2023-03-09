import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutterpod/api.dart';
import 'package:flutterpod/exception/api_exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/user.dart';



class AuthService{

  static Dio dio = Dio();

 static Future<Either<String, User>>  userLogin({
   required String email,
   required String password
}) async{
     try{
       final response = await dio.post(Api.login, data: {
         'email': email,
         'password': password
       });
       final user = User.fromJson(response.data);
      final box =  Hive.box<User>('user');
      box.add(user);
      return Right(user);
     }on DioError catch (err){
       return Left(DioException.getDioError(err));
     }
 }

  static Future<Either<String, bool>>  userSignUp({
    required String email,
    required String password,
    required String full_name
  }) async{
    try{
      final response = await dio.post(Api.signUp, data: {
        'email': email,
        'password': password,
        'fullname': full_name
      });
      return Right(true);
    }on DioError catch (err){
      return Left(DioException.getDioError(err));
    }
  }


}