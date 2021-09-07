import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/login/shop_login_screen.dart';
import 'package:shop_app/network/cache_helper.dart';
import 'package:shop_app/network/dio_helper.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shop_app/shop_layout/cubit/layout_cubit.dart';
import 'package:shop_app/shop_app/shop_layout/shop_layout.dart';

import 'shared/bloc.dart';
import 'on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  dynamic onBoarding = CacheHelper.getData(
    key: 'onBoarding',
  );
   token = CacheHelper.getData(key: 'token');
  // print(token);

  if (onBoarding) {
    if (token != null)
      widget = ShopLayOut();
    else
      widget = ShopLogin();
  } else {
    widget = OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  //
  MyApp({required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()
        ..getDataHome()
        ..getCategories()..getFavorites()..getUserData(),
      child: MaterialApp(
        home: startWidget,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
