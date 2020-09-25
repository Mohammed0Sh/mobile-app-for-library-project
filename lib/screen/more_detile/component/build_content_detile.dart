
import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/more_detile/component/build_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentDetile extends StatefulWidget {
  Map ob;
  ContentDetile(this.ob);

  @override
  _ContentDetileState createState() => _ContentDetileState();
}

class _ContentDetileState extends State<ContentDetile> {
  List keys = [];
  @override
  void initState() {
    super.initState();

    widget.ob.forEach((key, value) {
      setState(() {
        keys.add(key);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List getValueFromMap(key) {
      return widget.ob[key];
    }
    GlobalKey<ScaffoldState> globalKey=GlobalKey();
    return Scaffold(
      key: globalKey,
          body: Container(
          child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "تفاصيل أكثر",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 1),
            ),
          ),
          Expanded(
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(20)),
            elevation: 5,
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 30)]),
              child: ListView.separated(
                separatorBuilder: (context, ins) {
                  return Divider(
                    color: Colors.black,
                  );
                },
                itemCount: keys.length,
                itemBuilder: (context, index) {
                  if (index != 0) {
                    return BuildContentMoreDetile(
                      title: keys[index],
                      list: getValueFromMap(keys[index]),
                    );
                  } else
                    return Text('');
                },
              ),
            ),
          )),

          SizedBox(height: 20,)
        ],
      )),
    );
    
  }


}

