
import 'package:Library/screen/revsevation/component/card_reservation.dart';
import 'package:flutter/material.dart';

class BuildListReservation extends StatelessWidget {
  final List list;
  final isReservation;
  const BuildListReservation({
    Key key, this.list, this.isReservation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    int listLength=list.isEmpty?0:list.length;
    
    return (listLength == 0)?Center(
            child: Text('لا يوجد عناصر ',style: TextStyle(color: Colors.black87,fontSize: 39),),
          ): ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount:listLength,
        itemBuilder: (BuildContext context, index) {
          return CardReservation(
            index:index ,
            resrvation:list[index] , 
            isReservation: isReservation,    
          );
        });
  }
}
