import 'package:Library/screen/detile/components/favorite.dart';
import 'package:Library/service/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionBlock extends StatelessWidget {
  final String description;
  final id;
  final favorateState;
  const DescriptionBlock({
    Key key, this.description, this.id, this.favorateState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding:EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
         Text("تفاصيل العنصر",style: TextStyle(fontSize: SizeConfig.titleSize*3.75,fontWeight: FontWeight.bold,letterSpacing: 1,fontStyle: FontStyle.italic),),
         Favorite(id,favorateState)

              ],
            ),
        SizedBox(height: 10,),
        
        Container(
          height: SizeConfig.heightMulti*25,
                  child: SingleChildScrollView(
                    child: Text(description,style: TextStyle(fontSize: 20,
       
          ),),
                  ),
        ),
       

        ],
      ) ,
    );
  }
}


