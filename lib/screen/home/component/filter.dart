import 'package:Library/service/constants.dart';
import 'package:Library/service/data_transfer.dart';
import 'package:Library/service/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  final String filterName;
  final List filterOption;

  const Filter({Key key, this.filterName, this.filterOption}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  
    filterOption.add({'id':0,'name':'الكل'});
      
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 5,
        ),
        height: 100,
        width: SizeConfig.imageSize * (80),
        child: Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              height: 100,
              width: SizeConfig.imageSize * (80),
              margin: EdgeInsets.symmetric(vertical: 17, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        color: Colors.brown,
                        offset: Offset(-20, 5))
                  ]),
              child: Container(
                margin: EdgeInsets.only(right: 22.3 * SizeConfig.imageSize),
                child: PopupMenuButton(
                
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    initialValue: 0,

                    shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.black54,
                    tooltip: filterName,
                    enabled: true,
                    
                    onSelected: (index) {
                      searchResult[filterName]=index.toString();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Icon(
                            Icons.arrow_drop_down_circle,
                            size: 30,
                            color: Colors.brown,
                          ),
                        ),
                        Text(
                          filterName,
                          style: KfilterStyle.copyWith(
                              fontSize: 23, color: Colors.black),
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
              ),
            ),
            Container(
              height: 11.25 * SizeConfig.heightMulti,
              width: SizeConfig.imageSize * (22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.orange,Colors.brown[400]]
                )
              ),
              child: Icon(
                Icons.filter_list,
                size: 50,
                color: Colors.white,
              ),
            ),
            
          ],
        ));
  }
}


