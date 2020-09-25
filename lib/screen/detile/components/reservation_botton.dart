import 'package:Library/service/size_config.dart';
import 'package:flutter/material.dart';

class ReservationBotton extends StatelessWidget {
 final Function onPress;
 final borrowState;
  const ReservationBotton({
     this.onPress,
    Key key, this.borrowState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return RawMaterialButton(
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    highlightColor: Colors.red,
     onPressed:onPress,
    child: Container(
     alignment: Alignment.center,
    
     height: SizeConfig.heightMulti*7.5,
     width: MediaQuery.of(context).size.width*.5,
              decoration: BoxDecoration(
             
     borderRadius: BorderRadius.all(Radius.circular(20)),

              ),
            child: Text((borrowState)?'الغاء الحجز':'حجز',style: TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: SizeConfig.heightMulti * 4.3,
         
       ),),
    ),
              );
  }
}

