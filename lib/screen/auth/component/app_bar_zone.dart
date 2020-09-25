import 'package:flutter/material.dart';

class AppBarZone extends StatelessWidget {
  final title;
  const AppBarZone({
    Key key, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
           
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(
                "عودة",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black12, boxShadow: [
              BoxShadow(
                blurRadius: 30,
                color: Colors.black54,
              )
            ]),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text((title=='login')?
              "تسجيل الدخول للمكتبة":'طلب تسجيل عضوية في للمكتبة',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
