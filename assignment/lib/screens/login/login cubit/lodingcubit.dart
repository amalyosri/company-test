// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../componants/endpoint.dart';
import '../../../dio_helper/dio_helper.dart';

import '../../../model/login.dart';
import 'lodin_status.dart';

class Cubitlogin extends Cubit<LoginStates> {
  Cubitlogin() : super(LoginInitial());

  static Cubitlogin get(context) => BlocProvider.of(context);
  IconData passicon = Icons.visibility_outlined;
  bool ispass = true;

  void changepassicon() {
    ispass = !ispass;
    passicon =
        ispass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangepassIconState());
  }

  late LoginModel loginmodel;

  void userlogin({required String email, required String pass}) {
    emit(Loginloding());
    DioHelper.postData(url: Login, data: {
      "email": email,
      "password": pass,
    }).then((value) {
      loginmodel = LoginModel.fromjson(value.data);
      // print(loginmodel.data?.token);
      // print(loginmodel.status);
      // print(loginmodel.message);

      emit(LoginSuccess(loginmodel));
    }).catchError((onError) {
      print(onError.toString());
      emit(LoginError(onError));
    });
  }
}
