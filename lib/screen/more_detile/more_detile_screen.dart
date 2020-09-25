import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/components/error_dialog.dart';
import 'package:Library/screen/more_detile/component/build_content_detile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class MoreDetile extends StatelessWidget {
  var id;
  MoreDetile(this.id);
  @override
  Widget build(BuildContext context) {


     return Scaffold(
        appBar: AppBar(
          
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "رجوع",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
        ),
 
      ),
      body: SafeArea(
        child: Container(
          child:FutureBuilder<Map>(
                future: Future.delayed(
                  Duration(seconds: 1),
                  () => ApiController().getMoreDetile(id),
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                 
                    return ContentDetile(snapshot.data);
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

