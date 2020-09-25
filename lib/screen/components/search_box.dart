import 'package:Library/service/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged onchange;
  final Function press;

  const SearchBox({
    Key key,@required this.onchange, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.73),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
             child: TextField(
               textDirection: TextDirection.rtl,
               textAlign: TextAlign.right,
              onChanged:onchange,
             style: TextStyle(
               color: Colors.black,
               fontSize: 3.75 * SizeConfig.heightMulti,
               fontWeight: FontWeight.bold
             ),
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(5),
                
                hintText: "بحث عن عنصر",
                hintStyle: TextStyle(color: Colors.black54,fontSize: 28,fontWeight: FontWeight.bold)

              ),
            ),
          ),
            IconButton(
            onPressed: press,
            color: Colors.black,
            
            icon: Icon(Icons.search,size: 9 * SizeConfig.imageSize,color: Colors.black87,),
          ),
        ],
      ),
    );
  }
}