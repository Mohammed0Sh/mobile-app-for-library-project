

import 'package:Library/screen/detile/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetile extends StatelessWidget {
 var index;
 final item;
 ItemDetile(this.index, this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "رجوع",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
 
      ),
      
      body: Body(index:index,item:item),
    );
  }
}

