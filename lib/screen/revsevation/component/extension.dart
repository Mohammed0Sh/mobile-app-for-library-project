import 'package:Library/Api/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Extension extends StatefulWidget {
  final id;

  const Extension({Key key, this.id}) : super(key: key);
  @override
  _ExtensionState createState() => _ExtensionState();
}

class _ExtensionState extends State<Extension> {
  var isSender = false;

  TextEditingController controllerText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('999999999999999999999999');
    print(widget.id);
    controllerText=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    
    GlobalKey<FormState> globalKey = GlobalKey();
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.6),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            'تمديد الاستعارة',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 20),
                  width: 100,
                  child: Form(
                    key: globalKey,
                    child: TextFormField(
                      validator: (value) =>
                          (value.isEmpty) ? 'ادخل عدد الايام ' : null,
                     controller: controllerText,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: InputBorder.none,
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red))),
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Text(
                  'عدد الايام',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: (isSender)
                ? Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  )
                : RaisedButton(
                    child: Text(
                      'طلب تمديد',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      if (globalKey.currentState.validate()) {
                        setState(() {
                          isSender = !isSender;
                        });
                     
                        dynamic res = await Future.delayed(Duration(seconds: 1),
                            () => ApiController().storeExtendBorrow(widget.id,controllerText.text));
                        if (res != null) {
                          if (res['status'] == true) {
                            Navigator.of(context).pop();
                            Fluttertoast.showToast(
                                msg: 'تم ارسال الطلب',
                                toastLength: Toast.LENGTH_LONG);
                          } else {
                            Navigator.of(context).pop();
                            Fluttertoast.showToast(
                                msg: 'خطأ : تم الطلب مسبقا',
                                toastLength: Toast.LENGTH_LONG);
                          }
                        }
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
