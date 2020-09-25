import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/addition/component/drop_down.dart';
import 'package:Library/screen/components/error_dialog.dart';
import 'package:Library/service/data_transfer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BuildContainStep2 extends StatefulWidget {
  const BuildContainStep2({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _BuildContainStep2State createState() => _BuildContainStep2State();
}

class _BuildContainStep2State extends State<BuildContainStep2> {
  String maintainer='',subject='';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.brown,
          ],
        ),
      ),
      child: FutureBuilder(
        future: Future.delayed(
          Duration(seconds: 2),
          () => ApiController().filters(),
        ),
        builder: (context, snapshot) {

          if (snapshot.hasData) {
         
            return Container(
              
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 10)
                  ]),
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              height: widget.size.height * (0.6),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "المشرف والمادة",
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                      ),
                    ),
             SizedBox(height: 50,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          DropDown(filterName:'maintainer',filterOption:snapshot.data['maintainer'],),
                          Text(
                            ': تحديد مشرف',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          DropDown(filterName: 'subject',filterOption: snapshot.data['subject'],),
                          Text(
                            ' : تحديد مادة',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                         

                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            showErrorDialog(context, 'خطأ بالاتصال');
          } else {
            return SpinKitCircle(
              color: Colors.orange,
              size: 65,
            );
          }
        },
      ),
    );
  }
}
