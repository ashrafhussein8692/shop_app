

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/model/change_favorites.dart';
import 'package:shop_app/model/favorites_model.dart';

import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/model/user_data.dart';
import 'package:shop_app/network/dio_helper.dart';
import 'package:shop_app/network/end_point.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shop_app/cateogries_screen/cateogries_screen.dart';
import 'package:shop_app/shop_app/favorties_screen/favorties_screen.dart';
import 'package:shop_app/shop_app/products_screen/products_screen.dart';
import 'package:shop_app/shop_app/settings_screen/settings_screen.dart';
import 'package:shop_app/shop_app/shop_layout/cubit/states.dart';


class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());



  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> BottomScreen = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen()
  ];

  void ChangeScreen(int index) {
    currentIndex = index;
    emit(ShopChangNavState());
  }

  HomeModel? homeModel;
  Map favorites = {};

  void getDataHome() {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: HOME,
      token: token
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      // print(value.data);
      homeModel!.data!.products!.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites
        });

        // print(favorites);
      });
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      emit(ShopErrorHomeDataState());
      print(error.toString());
    });
  }

  CategoriesModel? categoryModel;

  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORY,
      token: token
    ).then((value) {
      categoryModel = CategoriesModel.fromJson(value.data);
      // print(value.data);
       emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      emit(ShopErrorCategoriesState());
      print(error.toString());
    });
  }
  ChangeFavoritesModel? changeFavoritesModel;
   void changeFavorites(int? productId){
     favorites[productId]= !  favorites[productId];
     emit(ShopChangeFavoritesState());
    DioHelper.postData(
        url: FAVORITES,
        data: {
          'product_id':productId
        },
        token: token


    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      if( ! changeFavoritesModel!.status){
        favorites[productId] =  ! favorites[productId];
      }else {
        getFavorites();
      }



       print(value.data);
      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error){
      favorites[productId] = ! favorites[productId];

      emit(ShopErrorChangeFavoritesState());

    });
    // print(Error);
   }
   FavoritesModel? favoritesModel;
  void getFavorites() {
    emit(ShopLoadingFavoritesState());
    DioHelper.getData(
        url: FAVORITES,
        token: token
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
       // print(value.data);
      emit(ShopSuccessFavoritesState());
    }).catchError((error) {
      emit(ShopErrorFavoritesState());
      print(error.toString());
    });
  }
  ShopLoginModel? userModel;
  void getUserData() {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
        url: PROFILE,
        token: token
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
       print(value.data);
      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      emit(ShopErrorUserDataState());
      print(error.toString());
    });
  }

}
