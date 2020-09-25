import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/components/error_dialog.dart';
import 'package:Library/screen/revsevation/component/extension.dart';
import 'package:Library/service/data_transfer.dart';
import 'package:Library/service/size_config.dart';
import 'package:flutter/material.dart';

class CardReservation extends StatefulWidget {
  final Map resrvation;
  final isReservation;
  final index;
  const CardReservation({
    Key key,
    this.resrvation,
    this.index,
    this.isReservation,
  }) : super(key: key);

  @override
  _CardReservationState createState() => _CardReservationState();
}

class _CardReservationState extends State<CardReservation> {
  bool progressIndicator = true;

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
                color:
                    (widget.index.isEven) ? Colors.brown : Colors.orange[100],
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
                  onTap: () async {
         
                    if (!widget.isReservation) {

                      await showDialog(context: context,
                      builder: (context){
                        return AlertDialog(
                          content: Extension(id: widget.resrvation['id'] ,),
                        );
                      }
                      );

                    } else {
                                 setState(() {
                      progressIndicator = !progressIndicator;
                    });
                      dynamic res = await ApiController()
                          .addAndCancelReservation(sharedPrefrences.token,
                              widget.resrvation['item_id']);
                      if (res != null) {
                        setState(() {
                          progressIndicator = !progressIndicator;
                        });
                       await showErrorDialog(
                            context, res['message'].toString(), 'تنبيه');
                            Navigator.of(context).pop();
                      }
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                        color: (!widget.isReservation)
                            ? (widget.index.isEven)
                                ? Colors.brown
                                : Colors.orange[300]
                            : Colors.brown,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: (progressIndicator)
                        ? (!widget.isReservation)
                            ? Text(
                                'تمديد ',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                "الغاء الحجز",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                        : CircularProgressIndicator(),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: ()async{
                  await  showErrorDialog(context, widget.resrvation['get_item']['name'] ,'اسم العنصر');
                  },
               child: Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.heightMulti * 5.6, right: 30),
                    alignment: Alignment.topRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'اسم العنصر : ' + widget.resrvation['get_item']['name'],
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: SizeConfig.heightMulti * 2.3,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                            ' تاريخ الارجاع  : ' +
                                widget.resrvation['return_date'],
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: SizeConfig.heightMulti * 2.3,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
