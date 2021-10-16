import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopapp/modules/login/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/network/end_points.dart';
import 'package:shopapp/network/remote/dio.dart';

import '../login_model.dart';
class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit():super(LoginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);

  late LoginModel loginModel;
  void userLogin({required String email ,required String password})
  {
    emit(LoginLoadingState());
   // print('asmaa');
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email':email,
          'password':password
        }).then((value){
      loginModel=LoginModel.fromJson(value.data);
      print(loginModel.message);
      emit(LoginSuccessState());
    }).catchError((error){
      emit(LoginFailState(error.toString()));
      print(error.toString());
    });
  }
  bool isPassword=true;
  IconData suffix= Icons.visibility_outlined;
  void changePasswordVisibility()
  {
    isPassword!=isPassword;
    suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
  }
}
