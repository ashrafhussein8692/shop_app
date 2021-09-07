import 'package:shop_app/model/user_data.dart';

abstract class ShopRegisterStates{}
class ShopRegisterInitialState extends ShopRegisterStates{}
class ShopRegisterLoadState extends ShopRegisterStates{}
class ShopRegisterSuccessState extends ShopRegisterStates{
  final ShopLoginModel loginModel;

  ShopRegisterSuccessState(this.loginModel);
}
class ShopRegisterErrorState extends ShopRegisterStates{
  final String Error;

  ShopRegisterErrorState(this.Error);
}
class ShopChangePasswordState extends ShopRegisterStates{}
