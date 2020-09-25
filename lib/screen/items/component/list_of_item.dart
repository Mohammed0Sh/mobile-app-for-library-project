import 'package:Library/screen/items/component/card_item.dart';
import 'package:flutter/material.dart';

class BuildListItem extends StatelessWidget {
  final List list;
  const BuildListItem({
    Key key, this.list,
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
    
          return CardItem(
            index: index,
            item: list[index],  
          );
        });
  }
}
