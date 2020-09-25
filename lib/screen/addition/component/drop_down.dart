import 'package:Library/service/constants.dart';
import 'package:Library/service/data_transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String filterName;
  final List filterOption;

  const DropDown({Key key, this.filterName, this.filterOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 5,
          left: 10
        ),
        height: 40,
        width:150,
        child: PopupMenuButton(
           
            initialValue: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.black54,
            tooltip: filterName,
            enabled: true,
            onSelected: (index) {
             addItemResult[filterName]='$index';
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 0),
                  child: Icon(
                    Icons.arrow_drop_down_circle,
                    size: 30,
                    color: Colors.brown,
                  ),
                ),
                Text(
                 filterName,
                  style:
                      KfilterStyle.copyWith(fontSize: 23, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
           itemBuilder: (context) => filterOption
                        .map((e) => PopupMenuItem<int>(
                            value: e['id'],
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 20, color: Colors.black38)
                                    ],
                                    
                                    ),
                                child: (filterName == 'maintainer')
                                    ?(e['id'] == 0)?Text(
                                        e['name'],
                                        style: KfilterStyle,
                                      ): Text(
                                        e['first_name'] + e['last_name'],
                                        style: KfilterStyle,
                                      )
                                    : Text(
                                        e['name'],
                                        style: KfilterStyle,
                                      ),
                              ),
                            
                            ))
                        .toList()),
               );
  }
}
