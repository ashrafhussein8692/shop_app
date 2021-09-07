import 'package:shop_app/model/change_favorites.dart';
import 'package:shop_app/model/user_data.dart';

abstract class ShopStates{}
class ShopInitialState extends ShopStates{}
class ShopChangNavState extends ShopStates{}
class ShopLoadingHomeDataState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{}
class ShopErrorHomeDataState extends ShopStates{}
class ShopSuccessCategoriesState extends ShopStates{}
class ShopErrorCategoriesState extends ShopStates{}
class ShopChangeFavoritesState extends ShopStates{

}
class ShopSuccessChangeFavoritesState extends ShopStates{
  final ChangeFavoritesModel model ;

  ShopSuccessChangeFavoritesState(this.model);
}
class ShopErrorChangeFavoritesState extends ShopStates{}
class ShopLoadingFavoritesState extends ShopStates{}
class ShopSuccessFavoritesState extends ShopStates{}
class ShopErrorFavoritesState extends ShopStates{}
class ShopLoadingUserDataState extends ShopStates{}
class ShopSuccessUserDataState extends ShopStates{
   final ShopLoginModel userModel;

  ShopSuccessUserDataState(this.userModel);
}
class ShopErrorUserDataState extends ShopStates{}
