import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpod/models/crud_state.dart';
import 'package:flutterpod/services/auth_service.dart';





final authProvider = StateNotifierProvider<AuthProvider, CrudState>((ref) => AuthProvider(
  CrudState(errMessage: '', isError: false, isLoad: false, isSuccess: false)
));

class AuthProvider extends StateNotifier<CrudState>{
  AuthProvider(super.state);


 Future<void>  userLogin({
    required String email,
    required String password
  }) async{
   state = state.copyWith(isLoad: true,isError: false,isSuccess: false);
    final response  = await AuthService.userLogin(email: email, password: password);
    response.fold(
            (l) => state = state.copyWith(isLoad: false,isError: true,isSuccess: false, errMessage: l),
            (r) => state = state.copyWith(isLoad: false,isError: false,isSuccess: r, errMessage: '')
    );

  }


}