import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/login/shop_login_screen.dart';
import 'package:shop_app/network/cache_helper.dart';
import 'package:shop_app/shop_app/search_screen/Search_screen.dart';
import 'package:shop_app/shop_app/settings_screen/settings_screen.dart';
import 'package:shop_app/shop_app/shop_layout/cubit/layout_cubit.dart';
import 'package:shop_app/shop_app/shop_layout/cubit/states.dart';

class ShopLayOut extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){} ,
      builder: (context,state){
        var cubit = ShopCubit.get(context);
        return Scaffold(
            appBar: AppBar(backgroundColor: Colors.white,
              elevation: 0,
              title: Text('Salla',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
              ),
              actions: [
                IconButton(color: Colors.black,
                    iconSize:30 ,
                    onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                }, icon: Icon(Icons.search))
              ],

            ),
          body: cubit.BottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            type:BottomNavigationBarType.fixed ,
            onTap: (index){
            cubit.ChangeScreen(index);
          },
            currentIndex: cubit.currentIndex,
            items:
          [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Categories'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings'
            ),
          ],
          ),

        );
      } ,
    );
  }
}
