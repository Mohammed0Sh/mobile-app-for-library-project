import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/components/error_dialog.dart';
import 'package:Library/screen/home/component/filter_list.dart';
import 'package:Library/screen/components/search_box.dart';
import 'package:Library/screen/items/items_screen.dart';
import 'package:Library/service/data_transfer.dart';
import 'package:Library/service/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool filter = false;
  
  @override
  Widget build(BuildContext context) {
   
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.brown,
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: SizeConfig.heightMulti * 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                image: DecorationImage(
                    image: AssetImage('assets/library.jpg'),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SearchBox(
                  onchange: (value) {
                    searchResult['search'] = value;
                  },
                  press: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ItemScreen(
                            'نتيجة البحث', () => ApiController().search())));
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    alignment: Alignment.centerRight,
                    decoration:
                        BoxDecoration(color: Colors.black87.withOpacity(0.2)),
                    child: Text(
                      'ادخل معلومات بحثك وبامكانك فلترة النتائج في الاسفل',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
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
                  return FilterList(
                    snapshot.data,
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
          ))
        ],
      ),
    );
  }
}
