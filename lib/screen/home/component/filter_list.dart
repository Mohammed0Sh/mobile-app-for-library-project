
import 'package:Library/screen/home/component/filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterList extends StatefulWidget {
  Map filters;
  FilterList(this.filters);
  @override
  _FilterListState createState() => _FilterListState();

}

class _FilterListState extends State<FilterList> {
    List filtersNames=[];
  @override
  void initState() { 
    super.initState();
  widget.filters.forEach((key, value) {
    filtersNames.add(key);
    
  });
   
  }

 List getFilterOption(key){
    return  widget.filters[key];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
               scrollDirection: Axis.vertical,
               itemBuilder: (BuildContext context , index){
               return Filter(filterName:filtersNames[index],filterOption:getFilterOption(filtersNames[index]),);
             },
             itemCount: filtersNames.length,
             ),
    );
  }
}


