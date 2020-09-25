import 'package:Library/service/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPoster extends StatelessWidget {
  const ItemPoster({
    Key key,
    this.img,
  }) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
       
  
        margin: EdgeInsets.only(top: 30),
        height: SizeConfig.heightMulti * 30,
        width: SizeConfig.imageSize * 50,
        child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.transparent,
              child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        child: Image.asset(
          img,
          fit: BoxFit.cover,
        ))),
      ),
    );
  }
}
