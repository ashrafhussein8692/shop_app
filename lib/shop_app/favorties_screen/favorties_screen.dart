import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/model/change_favorites.dart';
import 'package:shop_app/model/favorites_model.dart';
import 'package:shop_app/shop_app/shop_layout/cubit/layout_cubit.dart';
import 'package:shop_app/shop_app/shop_layout/cubit/states.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Conditional.single(
          context: context,
          conditionBuilder: (context)=>state is ! ShopLoadingFavoritesState,
          widgetBuilder: (context)=>  ListView.separated(
              itemBuilder: (context, index) => buildFavItem(
                  ShopCubit.get(context).favoritesModel!.data!.data[index],context),
              separatorBuilder: (context, index) => Divider(),
              itemCount:ShopCubit.get(context).favoritesModel!.data!.data.length
          ),
          fallbackBuilder:  (context)=>Center(child: CircularProgressIndicator())
        );
      },
    );
  }

  Widget buildFavItem(FavoritesData model, context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 150,
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(
                        '${model.product!.image}'),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                   if (model.product!.discount != 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    color: Colors.red,
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.product!.name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14, color: Colors.black, height: 1.3),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '${model.product!.price}',
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        if (model.product!.discount != 0)
                        Text(
                          '${model.product!.oldPrice}',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                             ShopCubit.get(context).changeFavorites(model.product!.id);
                             print(model.id);
                          },
                          icon: CircleAvatar(
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                              backgroundColor:
                                ShopCubit.get(context).favorites[model.product!.id]
                                     ? Colors.blue
                                    : Colors.grey
                              ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
//   Padding(
//   padding: const EdgeInsets.all(20.0),
//   child: Container(height: 150,
//     child: Row(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomStart,
//           children: [
//             Image(image: NetworkImage('https://student.valuxapps.com/storage/uploads/products/1615441020ydvqD.item_XXL_51889566_32a329591e022.jpeg'),
//             width: 150,
//               height: 150,
//               fit: BoxFit.cover,
//             ),
//             Container(
//               color: Colors.red,
//               padding: EdgeInsets.symmetric(horizontal: 8),
//
//               child: Text('DISCOUNT',
//
//               textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white
//                 ),
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Column(
//           children: [
//             Text('hakonamatataakxmjk',
//             maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             Spacer(),
//             Text('500',
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         )
//       ],
//     ),
//   ),
// );
