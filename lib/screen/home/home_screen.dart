
import 'dart:math';
import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/home/component/body.dart';
import 'package:Library/screen/home/component/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    super.initState();
    //ApiController().filters();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
        animation =Tween(begin: 1.0,end: 0.0).animate(animationController);
    animationController.forward();
        

  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {   
    return CustomAnimation(
      animation: animation,
    );
  }
}

class CustomAnimation extends AnimatedWidget {

  CustomAnimation({Key key,  Animation animation})
      : 
        super(key: key, listenable: animation);



  @override
  Widget build(BuildContext context) {

    Animation animation = listenable;
    return Transform(
      transform:
          Matrix4.identity()..rotateY(pi*animation.value),
      child:  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown,
              elevation: 0,
              title: Text(
                "الصفحة الرئيسية",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              ],
            ),
            drawer: Drawer_block(),
            body: Body()));

  }
}
