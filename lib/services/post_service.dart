import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutterpod/constant/firebase_instances.dart';
import 'package:flutterpod/models/post.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;


final postStream = StreamProvider((ref) => PostService.getPosts());

class PostService{


  static CollectionReference postDb = FirebaseInstances.fireStore.collection('posts');

static Stream<List<Post>> getPosts(){
  return postDb.snapshots().map((event) => getPostData(event));
}

static List<Post> getPostData(QuerySnapshot snapshot){
   return snapshot.docs.map((e){
     final json = e.data() as Map<String, dynamic>;
     return Post(
          imageId: json['imageId'],
         like: Like.fromJson(json['like']),
         imageUrl: json['imageUrl'],
         userId: json['userId'],
         comments: (json['comments'] as List).map((e) => Comment.fromJson(e)).toList(),
         detail: json['detail'],
         postId: e.id,
         title: json['title']
     );
   }).toList();
}


  static  Future<Either<String, bool>> postAdd({
    required  String title,
    required String detail,
    required String userId,
    required XFile image
  }) async{
    try{

      final ref = FirebaseInstances.fireStorage.ref().child('postImage/${image.name}');
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();

         await postDb.add({
         'userId': userId,
         'title': title,
         'detail': detail,
         'imageUrl': url,
           'imageId': image.name,
         'like':{
           'likes': 0,
         'usernames': []
         },
        'comments': []
         });

      return Right(true);

    } on FirebaseAuthException catch(err){
      return  Left('${err.message}');
    }

  }



  static Future<Either<String, bool>> postUpdate({
    required  String title,
    required String detail,
    required String postId,
     String? imageId,
     XFile? image
  }) async{
    try{
     if(image == null){
       await postDb.doc(postId).update({
         'title': title,
         'detail': detail
       });
     }else{
       final ref = FirebaseInstances.fireStorage.ref().child('postImage/$imageId');
       await ref.delete();
       final ref1 = FirebaseInstances.fireStorage.ref().child('postImage/${image.name}');
       await ref1.putFile(File(image.path));
       final url = await ref1.getDownloadURL();
       await postDb.doc(postId).update({
         'title': title,
         'detail': detail,
         'imageId': image.name,
         'imageUrl': url
       });
     }
      return Right(true);

    } on FirebaseAuthException catch(err){
      return  Left('${err.message}');
    }

  }


  static  Future<Either<String, bool>> postRemove(String postId, String imageId) async{
    try{
       await postDb.doc(postId).delete();
       final ref = FirebaseInstances.fireStorage.ref().child('postImage/$imageId');
       await ref.delete();

      return Right(true);
    } on FirebaseAuthException catch(err){
      return  Left('${err.message}');
    }

  }

  static  Future<Either<String, bool>> addLike() async{
    try{
      final credential = await FirebaseInstances.firebaseAuth.signOut();
      return Right(true);
    } on FirebaseAuthException catch(err){
      return  Left('${err.message}');
    }

  }


  static  Future<Either<String, bool>> addComment() async{
    try{
      final credential = await FirebaseInstances.firebaseAuth.signOut();
      return Right(true);
    } on FirebaseAuthException catch(err){
      return  Left('${err.message}');
    }

  }



}