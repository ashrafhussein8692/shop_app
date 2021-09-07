import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:shop_app/login/shop_login_screen.dart';
import 'package:shop_app/network/cache_helper.dart';
import 'package:shop_app/shop_app/shop_layout/cubit/layout_cubit.dart';
import 'package:shop_app/shop_app/shop_layout/cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
     listener: (context,state){} ,
     builder: (context,state){
       var model = ShopCubit.get(context).userModel;
       nameController.text = model!.data!.name!;
       emailController.text = model.data!.email!;
       phoneController.text = model.data!.phone!;



       return Conditional.single(
         context: context,
         conditionBuilder: (context)=>ShopCubit.get(context).userModel !=null,
         widgetBuilder: (context)=> Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
             children: [
               TextFormField(
                 controller: nameController,
                 validator: (value) {
                   if (value!.isEmpty) {
                     return 'Name is required';
                   }
                 },
                 keyboardType: TextInputType.name,
                 decoration: InputDecoration(
                     prefixIcon: Icon(Icons.person),
                     labelText: 'Name', border: OutlineInputBorder()),
               ),
               SizedBox(
                 height: 15,
               ),
               TextFormField(
                 controller: emailController,
                 validator: (value) {
                   if (value!.isEmpty) {
                     return 'Email Address is required';
                   }
                 },
                 keyboardType: TextInputType.emailAddress,
                 decoration: InputDecoration(
                     prefixIcon: Icon(Icons.email),
                     labelText: 'Email Address', border: OutlineInputBorder()),
               ),
               SizedBox(
                 height: 15,
               ),
               TextFormField(
                 controller: phoneController,
                 validator: (value) {
                   if (value!.isEmpty) {
                     return 'Phone is required';
                   }
                 },
                 keyboardType: TextInputType.phone,
                 decoration: InputDecoration(
                     prefixIcon: Icon(Icons.phone),
                     labelText: 'Phone', border: OutlineInputBorder()),
               ),
               SizedBox(
                 height: 15,
               ),
               Column(
                 children: [
                   Container(
                     height: 60,
                     width: double.infinity,

                     decoration: BoxDecoration(
                         color: Colors.blue,
                         borderRadius: BorderRadius.all(Radius.circular(8.0))
                     ),
                     child: TextButton(
                       onPressed: () {
                         singOut(context);

                       },
                       child: Text('LOGOUT',
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 15.0,
                             fontWeight: FontWeight.bold
                         ),
                       ),

                     ),
                   ),
                 ],
               )
             ],
           ),
         ),
          fallbackBuilder: (context)=> Center(child: CircularProgressIndicator())
       );
     } ,
    );
  }
}
 void singOut(context){
   CacheHelper.removeData(key: 'token').then((value) {
     if(value){
       Navigator.pushAndRemoveUntil(
           context,
           MaterialPageRoute(builder: (context) => ShopLogin()),
               (route) => false);
     }
   });
 }
