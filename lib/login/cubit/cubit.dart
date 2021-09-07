import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/login/cubit/states.dart';

import 'package:shop_app/model/user_data.dart';
import 'package:shop_app/network/dio_helper.dart';
import 'package:shop_app/network/end_point.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
   ShopLoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      print(value.data);
       loginModel= ShopLoginModel.fromJson(value.data);
       print(value.data);

       emit(ShopLoginSuccessState(loginModel!));

    }).catchError((error) {
      emit(ShopLoginErrorState(error.toString()));
      print(error);

    });
  }

  bool obscureText = true;
  IconData suffix = Icons.visibility_outlined;

  void changePassword() {
    obscureText = !obscureText;
    suffix =
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ShopChangePasswordState());
  }
}
