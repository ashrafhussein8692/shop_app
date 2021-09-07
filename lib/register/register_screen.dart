

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:shop_app/network/cache_helper.dart';
import 'package:shop_app/register/register_cubit/cubit.dart';
import 'package:shop_app/register/register_cubit/states.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shop_app/shop_layout/shop_layout.dart';

class RegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
       listener: (context, state){
         if(state is ShopRegisterSuccessState){
           if(state.loginModel.status){
             print(state.loginModel.message);
             print(state.loginModel.data!.token);
             CacheHelper.saveData(key: 'token', value: state.loginModel.data!.token).then((value) {
               token = state.loginModel.data!.token;
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                 return ShopLayOut();
               } ), (route) => false);
             });

           }
         }

       },
       builder: (context, state){
         return Scaffold(
           appBar: AppBar(),
           body: Center(
             child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(30.0),
                 child: Form(key: formKey,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('REGISTER',style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black87),),
                       SizedBox(
                         height: 30,
                       ),
                       TextFormField(
                         controller: nameController,
                         keyboardType: TextInputType.name,

                         validator: (value){
                           if(value!.isEmpty){
                             return 'User name is required';
                           }
                         },
                         decoration: InputDecoration(
                           labelText: 'User name',
                           prefixIcon: Icon(Icons.person),
                           border: OutlineInputBorder(),

                         ),

                       ),
                       SizedBox(
                         height: 15,
                       ),
                       TextFormField(
                         controller: emailController,
                         keyboardType: TextInputType.emailAddress,

                         validator: (value){
                           if(value!.isEmpty){
                             return 'Email address is required';
                           }
                         },
                         decoration: InputDecoration(
                           labelText: 'Email address',
                           prefixIcon: Icon(Icons.email_outlined),
                           border: OutlineInputBorder(),

                         ),

                       ),
                       SizedBox(
                         height: 15,
                       ),
                       TextFormField(
                         controller: passwordController,
                         keyboardType: TextInputType.text,
                         obscureText: ShopRegisterCubit.get(context).obscureText,
                         onTap:()=> ShopRegisterCubit.get(context).changePasswordVisibility(),

                         validator: (value){
                           if(value!.isEmpty){
                             return 'Password is required';
                           }
                         },
                         decoration: InputDecoration(
                           labelText: 'Password',
                           prefixIcon: Icon(Icons.lock_outline),
                           suffixIcon:Icon(ShopRegisterCubit.get(context).suffix),
                           border: OutlineInputBorder(),

                         ),

                       ),
                       SizedBox(
                         height: 15,
                       ),
                       TextFormField(
                         controller: phoneController,
                         keyboardType: TextInputType.phone,

                         validator: (value){
                           if(value!.isEmpty){
                             return 'Phone is required';
                           }
                         },
                         decoration: InputDecoration(
                           labelText: 'Phone',
                           prefixIcon: Icon(Icons.phone),
                           border: OutlineInputBorder(),

                         ),

                       ),
                       SizedBox(
                         height: 20,
                       ),
                       Conditional.single(
                           context: context,
                           conditionBuilder: (context)=> State is ! ShopRegisterLoadState,
                           widgetBuilder: (context)=> Container(
                             width: double.infinity,
                             height: 60,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(7),
                                 color: Colors.blue
                             ),
                             child: MaterialButton(
                                 onPressed: (){
                                   if(formKey.currentState!.validate()){
                                     ShopRegisterCubit.get(context).userRegister(
                                         name: nameController.text,
                                         email: emailController.text,
                                         password: passwordController.text,

                                         phone: phoneController.text);
                                   }
                                 }, child: Text('REGISTER',style: TextStyle(color: Colors.white,
                                 fontWeight: FontWeight.bold,fontSize: 20),)),),
                           fallbackBuilder: (context)=> CircularProgressIndicator()
                       )
                     ],
                   ),
                 ),
               ),
             ),
           ),
         );
       },
      ),
    );
  }
}
