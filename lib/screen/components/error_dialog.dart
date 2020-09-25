
import 'package:flutter/material.dart';

showErrorDialog(context,content,[title])async{
    return await showDialog(context: context,
    builder: (context){
      return AlertDialog(
        title: Text(title,textDirection: TextDirection.rtl,style: TextStyle(
           fontSize: 24,
         ),),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        content: Container(
          alignment: Alignment.centerRight,
          height: 100,
         child: Text(content,
         style: TextStyle(
           fontSize: 23,
         ),
         )
        ),
      );

    }
    );
  }