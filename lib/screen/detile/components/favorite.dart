import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/components/error_dialog.dart';
import 'package:Library/service/data_transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  final id;
  final bool favorateState;
  Favorite(this.id, this.favorateState);
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool  selected;

@override
void initState() { 
  super.initState();
    setState(() {
  
   selected=widget.favorateState;
  });
}
  
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () async {
        if(sharedPrefrences == null)
        {
          showErrorDialog(context, 'سجل دخول للمكتبة لتمتع بصلاحيات اكثر','');
        }
        else
        {
        dynamic res = await ApiController()
            .addAndCancelFavorate(sharedPrefrences.token, widget.id);
        if (res != null) {
          setState(() {
          selected = !selected;
          });
        }
        }

      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 30, spreadRadius: 5)
            ]),
        child: Icon(
          (selected) ? Icons.favorite : Icons.favorite_border,
          size: 35,
          color: Colors.red,
        ),
      ),
    );
  }
}
