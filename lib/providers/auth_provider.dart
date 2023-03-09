import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpod/models/user_state.dart';
import 'package:flutterpod/services/auth_service.dart';

import '../main.dart';





final authProvider = StateNotifierProvider<AuthProvider, UserState>((ref) => AuthProvider(

  UserState(errMessage: '', isError: false, isLoad: false, isSuccess: false,
      user: ref.watch(box)
  )

));

class AuthProvider extends StateNotifier<UserState>{
  AuthProvider(super.state);


 Future<void>  userLogin({
    required String email,
    required String password
  }) async{
   state = state.copyWith(isLoad: true,isError: false,isSuccess: false);
    final response  = await AuthService.userLogin(email: email, password: password);
    response.fold(
            (l) => state = state.copyWith(isLoad: false,isError: true,isSuccess: false, errMessage: l, user: []),
            (r) => state = state.copyWith(isLoad: false,isError: false,isSuccess: true, errMessage: '',user: [r])
    );

  }



  Future<void>  userSignUp({
    required String email,
    required String password,
    required String full_name
  }) async{
    state = state.copyWith(isLoad: true,isError: false,isSuccess: false);
    final response  = await AuthService.userSignUp(email: email, password: password, full_name: full_name);
    response.fold(
            (l) => state = state.copyWith(isLoad: false,isError: true,isSuccess: false, errMessage: l),
            (r) => state = state.copyWith(isLoad: false,isError: false,isSuccess: r, errMessage: '')
    );

  }


}