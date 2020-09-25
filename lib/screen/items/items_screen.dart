
import 'package:Library/screen/components/error_dialog.dart';
import 'package:Library/screen/items/component/list_of_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ItemScreen extends StatelessWidget {
   String title;
   Function apiFunction;
   ItemScreen(this.title,this.apiFunction);
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(

      appBar: AppBar(
        actions: <Widget>[
  
        ],
        title: Text(title,style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: SafeArea(
        child: Container(
          child:FutureBuilder(
                future: Future.delayed(
                  Duration(seconds: 2),
                  () =>apiFunction() 
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return BuildListItem(list: snapshot.data,);
                  } else if (snapshot.hasError) {
                  return  showErrorDialog(context,'خطأ بالاتصال','aaaaaa');
                  } else {
                    return SpinKitCircle(
                      color: Colors.orangeAccent,
                      size: 65,
                    );
                  }
                },
              ),
        ),
      ),
    );
  }
}