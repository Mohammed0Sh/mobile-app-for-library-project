import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/addition/component/drop_down.dart';
import 'package:Library/screen/components/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BuildContainStep3 extends StatefulWidget {
  const BuildContainStep3({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _BuildContainStep3State createState() => _BuildContainStep3State();
}

class _BuildContainStep3State extends State<BuildContainStep3> {
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
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "كلمات بحث و ملفات مرفقة",
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 50,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
  
                          Text(
                            ': تحديد ملف ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
       
                             Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
  
                          Text(
                            ' : تحديد صور',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 100,),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text('لارسال طلب اضافة العنصر للمكتبة  اضغط على متابعة',
                      style: TextStyle(fontSize: 24),
                      ),
                    )
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
