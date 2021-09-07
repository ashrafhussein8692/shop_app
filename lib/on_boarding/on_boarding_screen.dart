import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/login/cubit/cubit.dart';
import 'package:shop_app/login/cubit/states.dart';

import 'package:shop_app/login/shop_login_screen.dart';
import 'package:shop_app/network/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel(this.image, this.title, this.body);
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      'images/on_board1.jpg',
      'Welcome to E-Mart',
      "The world's largest shopping and travel community",
    ),
    BoardingModel(
      'images/board2.jfif',
      'On Boarding 2',
      "On Boarding 2 Body",
    ),
    BoardingModel(
      'images/on_board1.jpg',
      'On Boarding 3',
      "On Boarding 3 Body",
    ),
  ];

  var pageController = PageController();

  bool isLast = false;

  void submit(){
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value){
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ShopLogin()),
                (route) => false);
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: submit,
              child: Text(
                'SKIP',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: pageController,
                  itemBuilder: (context, index) =>
                      buildBoardingItems(boarding[index]),
                  itemCount: boarding.length,
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  }),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                      child: SmoothPageIndicator(
                          controller: pageController,
                          count: boarding.length,
                          effect: ExpandingDotsEffect(
                              dotColor: Colors.blue.shade100,
                              activeDotColor: Colors.blue))),
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    if (isLast) {
                     submit();
                    } else {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItems(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Text(
              '${model.title}',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Text(
              '${model.body}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      );
}
