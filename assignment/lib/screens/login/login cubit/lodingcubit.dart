// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../componants/endpoint.dart';
import '../../../dio_helper/dio_helper.dart';

import '../../../model/logins.dart';
import 'lodin_status.dart';

class Cubitlogin extends Cubit<LoginStates> {
  Cubitlogin() : super(LoginInitial());

  static Cubitlogin get(context) => BlocProvider.of(context);

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
