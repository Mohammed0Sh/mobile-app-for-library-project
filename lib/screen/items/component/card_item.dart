import 'package:Library/screen/components/error_dialog.dart';
import 'package:Library/screen/detile/item_detile.dart';
import 'package:Library/service/size_config.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final item;
  final index;

  const CardItem({
    Key key,
    this.index,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.imageSize * 3.33),
      height: SizeConfig.heightMulti * 15,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: SizeConfig.heightMulti * 11,
            decoration: BoxDecoration(
                color: (index.isEven) ? Colors.brown : Colors.orange[100],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(blurRadius: 30, color: Colors.black26)]),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
            ),
          ),
          Row(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ItemDetile(
                                index,
                                item
                                )));
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          color: (index.isEven)
                              ? Colors.brown
                              : Colors.orange[300],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Text(
                        "تفاصيل",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await showErrorDialog(context, item['name'], 'اسم العنصر');
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: SizeConfig.heightMulti * 5.6),
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        item['name'],
                        maxLines: 3,
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: SizeConfig.heightMulti * 2.25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Hero(
                tag: index,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(left: 10, right: 20),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        (item['item_type_id'] == 1)
                            ? 'assets/book.jpg'
                            : (item['item_type_id'] == 2)
                                ? 'assets/report.jpg'
                                : 'assets/index.jpg',
                        fit: BoxFit.cover,
                        height: SizeConfig.heightMulti * 16.25,
                        width: SizeConfig.imageSize * 22.23,
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
