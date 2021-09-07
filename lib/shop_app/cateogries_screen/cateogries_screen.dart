import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/shop_app/shop_layout/cubit/layout_cubit.dart';
import 'package:shop_app/shop_app/shop_layout/cubit/states.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) => buildCatItem(ShopCubit.get(context).categoryModel!.data!.data[index]),
            separatorBuilder: (context, index) => Divider(),
            itemCount: ShopCubit.get(context).categoryModel!.data!.data.length);
      },
    );
  }

  Widget buildCatItem(DataModel model) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
          children: [
            Image(
              image: NetworkImage(
                '${model.image}',
              ),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              '${model.name}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_outlined))
          ],
        ),
  );
}
