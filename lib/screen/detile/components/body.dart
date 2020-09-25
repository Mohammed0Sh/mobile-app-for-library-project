import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/components/error_dialog.dart';
import 'package:Library/screen/detile/components/description_block.dart';
import 'package:Library/screen/detile/components/item_poster.dart';
import 'package:Library/screen/detile/components/reservation_botton.dart';
import 'package:Library/screen/more_detile/more_detile_screen.dart';
import 'package:Library/service/data_transfer.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final item;
  final index;
  const Body({
    this.index,
    Key key,
    
 
    
  
     this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              alignment: Alignment.center,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: index,
                      child: ItemPoster(
                        img: ( item['item_type_id'] == 1)
                            ? 'assets/book.jpg'
                            : ( item['item_type_id'] == 2)
                                ? 'assets/report.jpg'
                                : 'assets/index.jpg',
                      ),
                    ),
                    DescriptionBlock(
                      description: item['desc'],
                      id: item['id'],
                      favorateState: item['isFavorate'],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MoreDetile(item['id'])));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              )),
                          child: Text(
                            "تفاصيل أكثر",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            ReservationBotton(
                borrowState: item['isReservation'],
                onPress: () async {
                  if (sharedPrefrences == null) {
                    await showErrorDialog(
                        context, 'يجب تسجيل الدخول للمكتبة', 'تنبيه');

                  } else {
                   dynamic res = await ApiController().addAndCancelReservation(sharedPrefrences.token, item['id']);
                  if(res !=null){
                   await showErrorDialog(context, res['message'], 'تنبيه');
                    Navigator.of(context).pop();
                  }

                  }
                }),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
